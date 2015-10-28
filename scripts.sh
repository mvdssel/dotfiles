#!/bin/bash

set -o xtrace   # Log all executed commands
set -e          # Exit on error

function init() {
    # disable dashboard
    defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock

    # enable quicklook selection
    defaults write com.apple.finder QLEnableTextSelection -bool TRUE;killall Finder

    # remove "last login" message from terminal
    touch ~/.hushlogin                  

    # install xcode command line tools
    # xcode-select --install

    # Installeren Brew
    # - Warnings bij brew doctor kunnen genegeerd worden
    # - Bij problemen: brew uninstall --force <tap> && brew install --force <tap>
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_taps() {
    declare -a taps=(
    vim     # nodig voor ycm
    cmake   # nodig voor ycm
    tree    # ls art
    toilet  # ascii art
    wget    # curl companion
    stow    # symlinking
    nmap    # check open ports on device
    git     # git
    hg      # bitbucket
    gpg     # enctyption

    # maven   # java dependency manager
    )

    for tap in ${taps[@]}; do
        brew install $tap
    done
}

function install_cask_taps() {
    declare -a cask_taps=(
    firefox
    iterm2
    dropbox
    get-lyrical
    vlc
    vlcstreamer
    spotify
    audacity
    mamp
    transmission
    scribus
    cyberduck
    skype

    # sequel-pro
    # protege
    # graphviz    # dot-graphs (linken aan protege via `which dot`)
    )

    for tap in ${cask_taps[@]}; do
        brew cask install $tap
    done
}

function install_quicklook_taps() {
    # https://github.com/sindresorhus/quick-look-plugins
    declare -a quicklook_taps=(
    qlcolorcode       # syntax highlighting
    qlstephen         # plain text files
    qlmarkdown        # markdown
    quicklook-json    # json
    qlprettypatch     # patch files
    quicklook-csv     # csv
    betterzipql       # zip contents
    qlimagesize       # size & resolution of images
    suspicious-package # pkg-packages
    )

    for tap in ${quicklook_taps[@]}; do
        brew cask install $tap
    done
}

function install_python() {
    brew install python3        # nieuwe python
    sudo easy_install pip       # Python package manager
    sudo pip install unidecode  # Nodig voor UltiSnip om met utf-8 te werken
}

function install_node() {
    brew install node

    declare -a packages=(
    grunt       # javascript task manager
    grunt-cli   # grunt command line interface
    bower       # web package manager
    jshint      # needed for jshint.vim
    nodemon     # automatisch herstarten van nodejs servers
    gulp        # javascript task runner
    karma       # javascript testing suite
    )

    for package in ${packages[@]}; do
        npm install -g $package
    done

    # default jshintrc
    # https://raw.githubusercontent.com/jshint/jshint/master/examples/.jshintrc
}

function install_gems() {
    declare -a gems=(
    sass
    compass
    # terminal-notifier
    )

    for gem in ${gems[@]}; do
        sudo gem install $gem
    done
}

# PHP
# cd ~/Sites; wget https://phar.phpunit.de/phpunit.phar
# cd ~/Sites; curl -sS https://getcomposer.org/installer | php

# ITERM
# base16 colorschemes:
# http://chriskempson.github.io/base16/
# https://github.com/chriskempson/base16
# iTerm-tab service:
# https://gist.github.com/eric-hu/5846890
# https://gist.github.com/cowboy/905546

# WIRESHARK
#brew install wireshark
## If your list of available capture interfaces is empty
## (default OS X behavior), try the following commands:
## This adds a launch daemon that changes the permissions of your BPF
## devices so that all users in the 'admin' group - all users with
## 'Allow user to administer this computer' turned on - have both read
## and write access to those devices.
#curl https://bugs.wireshark.org/bugzilla/attachment.cgi?id=3373 -o ChmodBPF.tar.gz
#tar zxvf ChmodBPF.tar.gz
#open ChmodBPF/Install\ ChmodBPF.app

# SAFARI
# addblock
# gostery
# javascript blocker

init
install_taps
install_cask_taps
install_quicklook_taps
install_python
install_node
install_gems

