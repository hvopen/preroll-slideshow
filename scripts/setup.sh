#!/usr/bin/env bash

fail () {
  echo "$@" >&2
  exit 1
}

main () {
  update_package_list
  install_tools
  install_apache2
  install_phantomjs
  clean_up_packages
  install_bash_profile
  configure_apache2
  restart_services
}

print_section () {
  local msg="$1"
  echo "************************************************************"
  echo "$msg"
  echo "************************************************************"
}

install_tools () {
  print_section "Installing good-to-have packages"
  sudo apt-get install -y \
    build-essential \
    git-core \
    vim \
    curl \
    ack-grep \
    wget \
    tree \
    || fail "Unable to install tools."
}

install_apache2() {
  print_section "Installing Apache2"
  sudo apt-get install -y apache2  || fail "Unable to install Apache2"
}

install_phantomjs() {
  print_section "Installing PhantomJS"
  sudo apt-get install -y phantomjs || fail "Unable to install PhantomJS"
}

update_package_list () {
  print_section "Updating package list"
  sudo apt-get update
}

clean_up_packages () {
  print_section "Cleaning up packages"
  (sudo apt-get autoremove -y && sudo apt-get autoclean -y) || fail "Unable to clean up packages"
}

install_bash_profile () {
  print_section "Installing .bash_profile"
  cp /vagrant/configs/.bash_profile /home/vagrant/.bash_profile
  chown vagrant:vagrant /home/vagrant/.bash_profile
}

configure_apache2 () {
  print_section "Configure Apache2"
  sudo cp /vagrant/configs/001-mhvlug_live.conf /etc/apache2/sites-enabled/  \
    || fail "Unable to copy Apache config file."
  
  sudo a2dissite 000-default || fail "Unable to disable the default site." 

  sudo ln -s /vagrant /var/www/html/mhvlug || fail "Unable to link /vagrant to /var/www/html/mhvlug" 
}

get_reveal_repo () {
  print_section "Getting Reveal.js"
  git clone https://github.com/hakimel/reveal.js.git /vagrant/reveal.js \
    || fail "Unable to clone Reveal.js"

  git checkout 
}

restart_services () {
  print_section "Restart services"
  sudo service apache2 restart
}

main "$@"

