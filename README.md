# mhvlug-monthly-presentation


This is the monthly pre-meeting presentation designed for mhvlug.org
meetings. We run this prior to the meeting kicking off so that people
know they are in the right room, and to give them information about
upcoming events.

It is based on reveal.js, and the git tree is a fork from a point of time
of reveal.js. We'll rebase over time to bring in new features.

## Updating the presentation

This presentation ends up live at http://mhvlug.org/live

If you would like to help update, please get on github and provide a
pull request, or ask to join the group.

You can simply update the information by editing the text of `index.html`

If you wish to test the site locally with reveal.js intact and have PhantomJS create the proper screenshots, you can use the steps below to use the preconfigured Vagrant development environment.

1. [Install Vagrant](https://docs.vagrantup.com/v2/installation/index.html)
2. clone this repo 
3. `cd mhvlug-monthly-presentation`
4. create the Vagrant machine by typing `vagrant up`
5. when the configuration has finished you can use a web browser and visit `localhost:8081` to see the presentation
6. To use PhantomJS to update the screenshots:
  1. `vagrant ssh` to ssh into the Vagrant machine
  2.  `make` will use the `Makefile` in this repo to run several PhantomJS scripts and update the screenshots in the presentation.
