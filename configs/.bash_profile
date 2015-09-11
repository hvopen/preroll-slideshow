# Auto switch to /vagrant
cd /vagrant

export VISUAL='vim'
export EDITOR='vim'

PS1='${debian_chroot:+($debian_chroot)}\u\[\033[0;33m\] ☆ \[\033[00m\]:\[\033[0;34m\]\w\[\033[0;32m\]\[\033[00m\]\$ '

# enable color support of ls and also add handy aliases
# Ubuntu
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    # human readable file sizes
    alias ls='ls -h --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    # human readable file sizes
    alias ls='ls -h'
fi

export CLICOLOR=1

alias ..='cd ..'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lah='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

# eval "$(/vagrant/sub/bin/kalamari init -)"
