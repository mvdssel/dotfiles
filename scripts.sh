#!/bin/bash

set -o xtrace   # Log all executed commands
set -e          # Exit on error

#######################################################################
#                              Services                               #
#######################################################################

#######################################################################
#                               Safari                                #
#######################################################################
# addblock
# gostery
# javascript blocker

#######################################################################
#                            OSX Settings                             #
#######################################################################
# enable quicklook selection
defaults write com.apple.finder QLEnableTextSelection -bool TRUE;killall Finder
# remove "last login" message from terminal
touch ~/.hushlogin                  
# install xcode command line tools
xcode-select --install

#######################################################################
#                                Brew                                 #
#######################################################################
# - EERST XCODE CMD LINE TOOLS INSTALLEREN
# - Warnings bij brew doctor kunnen genegeerd worden
# - Bij problemen: brew uninstall --force <tap> && brew install --force <tap>
# Installeren Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Bash-commands
brew install macvim                 # nodig voor YCM plugin
brew install tree                   # ls art
brew install toilet                 # ascii art
brew install wget                   # curl companion
brew install stow                   # symlinking
brew install nmap                   # check open ports on divice
brew install git                    # git(hub)
brew install hg                     # bitBucket
brew install gpg                    # encrypting enzo
brew install fortune                # awesome quotes

# Developer
brew install maven                  # JAVA package manager
brew install ant                    # JAVA process automator
brew install jena                   # JAVA & Semantic Web 
brew install homebrew/php/drush     # Drupal command line interface
brew install homebrew/php/composer  # PHP dependency manager

# Applications
brew cask install firefox           # sometimes better browsing
Caskroom/cask/iterm2                # awesome terminal
Caskroom/cask/sequel-pro            # SQL shizzle
brew cask install dropbox           # Dropbox
brew cask install get-lyrical       # iTunes lyrics
brew cask install vlc               # VLC
brew cask install audacity          # best audio manipulation software
brew cask install tunnelblick       # VPN at IBCN
brew cask install mamp              # Mamp
brew cask install transmission      # Transmission
brew cask install protege           # ontologies
brew cask install graphviz          # graph ontologies
                                    # linken aan protege via: which dot
                                    # en dan in instellingen van protege juist zetten

# QuickLook Plugins 
# https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode       # syntax highlighting
brew cask install qlstephen         # plain text files
brew cask install qlmarkdown        # markdown
brew cask install quicklook-json    # json
brew cask install qlprettypatch     # patch files
brew cask install quicklook-csv     # csv
brew cask install betterzipql       # zip contents
brew cask install qlimagesize       # size & resolution of images
brew cask install suspicious-package # pkg-packages

#######################################################################
#                               Python                                #
#######################################################################
brew install python3
sudo easy_install pip               # Python package manager
sudo easy_install Pygments          # LaTeX syntax highlighting via minted package
sudo pip install unidecode          # Nodig voor UltiSnip om met utf-8 te werken


#######################################################################
#                                Node                                 #
#######################################################################
brew install node
node install -g grunt               # javascript task manager
node install -g grunt-cli           # grunt command line interface
node install -g bower               # web package manager
node install -g jshint              # needed for jshint.vim
node install -g nodemon             # automatisch herstarten van nodejs servers

#######################################################################
#                                 Gem                                 #
#######################################################################
sudo gem install sass
sudo gem install compass
sudo gem install terminal-notifier

#######################################################################
#                              Wireshark                              #
#######################################################################
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

#######################################################################
#                                iTerm                                #
#######################################################################
# base16 colorschemes:
# http://chriskempson.github.io/base16/
# https://github.com/chriskempson/base16

# iTerm-tab service:
# https://gist.github.com/eric-hu/5846890
