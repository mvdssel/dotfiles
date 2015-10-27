# Dependencies
. ~/bin/colors

# Export Prompt {{{1 #
# Prompt variables {{{2 #
User="\u"
Hostname="\h"
Time12h="\T"
Time12a="\@"
PathShort="\W"
PathFull="\w"
NewLine="\n"
Jobs="\j"

# Prompt {{{2
alias GitBranch="git branch | egrep '^\*'| sed 's|\*[[:space:]]\([^[[:space:]]]*\)[[:space:]]*|\1|'"
export PS1="\[$Purple\]"'$(if [ -f ~/bin/prompt ]; then ~/bin/prompt; fi)$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
    if [ "$?" -eq "0" ]; then \
        # @4 - Clean repository - nothing to commit
        echo "\['$White'\] (\['$Green'\]"$(GitBranch)"\['$White'\])";\
    else \
        # @5 - Changes to working tree
        echo "\['$White'\] (\['$Orange'\]"$(GitBranch)"\['$White'\])";\
    fi) \['$Blue'\]\$ \['$Reset'\]"; \
else \
    # @2 - Prompt when not in GIT repo
    echo "\['$Blue'\] \$ \['$Reset'\]"; \
fi)'
# 2}}} #
# 1}}} #
# Export variables {{{1 #
export EDITOR='/usr/local/Cellar/vim/7.4.826/bin/vim'
export PATH="$PATH:$HOME/bin:."

# iTerm colors {{{1 #
export CLICOLOR=1					# ls command
export GREP_OPTIONS='--color=auto'	# make grep highlight matches

# Git {{{1 #
alias gitlog='git log --graph --decorate --all'
alias gitlogshort='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
# Git autocompletion
source /usr/local/Cellar//git/2.5.0/etc/bash_completion.d/git-completion.bash

# Aliasses & Functions {{{1 #
alias php="/usr/local/Cellar/php56/5.6.14/bin/php"
alias composer='php ~/Sites/composer.phar'
alias phpunit='php ~/Sites/phpunit.phar'
alias sf='php app/console'

alias vi="$EDITOR"
alias vim="$EDITOR"
alias vars='set|egrep "^[a-z]"'
alias aliasses='cat ~/.bash_profile | grep "alias " | sed -e "s/alias //g" | sed -e "s/=.*//g" | sort'

alias mysql='/Applications/MAMP/Library/bin/mysql'
alias start_mamp='/Applications/MAMP/bin/start.sh'
alias stop_mamp='/Applications/MAMP/bin/stop.sh'
alias restart_mamp='/Applications/MAMP/bin/stop.sh;sleep 1;/Applications/MAMP/bin/start.sh'

# Toon: Start Screensaver Alias
alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'

airport() {
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport $@
}
monosound() {
	setting=$(defaults read com.apple.universalaccess stereoAsMono)
	if [[ $setting = 0 ]]; then
		echo "FALSE"
	else
		echo "TRUE"
	fi
}
ll() {
    # A: list all entries, except . and .. 
    # G: colorized output
    # h: use unit suffixes (B, K, M, G)
    # l: list all files
    # p: write a '/' after each directory
    clear
    ls -AGhlp "$@"
}
# 1}}} #
cl

m="$HOME/Sites/jobertus/m"
cup="$HOME/Sites/jobertus/cup"
vop="$HOME/Documents/MAARTEN/Archief/2013-2014 UGent 3de/UGent 3de Bach/2 VOP/vop-2014-team07/VOP-server/src/main/webapp/javascript/home"
backend="$HOME/Sites/Mediaraven/wg_inscheck_systeem_scherm/backend"
frontend="$HOME/Sites/Mediaraven/wg_inscheck_systeem_scherm/frontend"

snippets="$HOME/.vim/bundle/vim-snippets/snippets"

# TeX {{{1
vex() {
    vim `find . -name "*.tex" -type f -maxdepth 1`
}

pdftwee() {
    pdflatex --shell-escape `find . -name "*.tex" -type f -maxdepth 1`
    pdflatex --shell-escape `find . -name "*.tex" -type f -maxdepth 1`
    open *.pdf
}

pdf() {
    pdflatex --shell-escape `find . -name "*.tex" -type f -maxdepth 1`
    open *.pdf
}
# 1}}} -
