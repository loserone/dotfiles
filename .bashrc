#######################################################
# EXPORTS
#######################################################


red="\[\e[0;33m\]"
yellow="\[\e[0;31m\]"

if [ `id -u` -eq "0" ]; then
	root="${yellow}"
else
	root="${red}"
fi

PS1="\[\e[0;37m\]┌─[${root}\u\[\e[0;37m\]][\[\e[0;96m\]\h\[\e[0;37m\]][\[\e[0;32m\]\w\[\e[0;37m\]]\n\[\e[0;37m\]└──╼ \[\e[0m\]"
#PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
#PS1='[\[\033[0;32m\]\u\[\033[0m\]@\h [\[\033[0;32m\]\W\[\033[0m\]]$ '
#PS1='[\[\033[1;36m\]\u\[\033[0m\]@\h \W]\$ '
#PS1="\[\033[0;32m\]\u@\H\[\033[0;34m\]\W$\[\033[00m\] "
#export PS1="\[\$(~/scripts/batmon.sh)\][\u@\h \W]\$ "
export EDITOR=/usr/bin/nano
export HISTFILESIZE=3000 # the bash history should save 3000 commands
export HISTCONTROL=ignoredups
#export TERM=urvxt
export BROWSER='chromium'
#dont put duplicate lines in the history.
alias hist='history | grep $1' #Requires one input

# Define a few Color's
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color
# Sample Command using color: echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"


# Source global definitions
if [ -f /etc/bashrc ]; then
       . /etc/bashrc
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
       . /etc/bash_completion
fi

#sudo bash completion too
complete -cf sudo
#complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | \
                 cut -f 1 -d ' ' | \
                 sed -e s/,.*//g | \
                 uniq | \
                 egrep -v [0123456789]) )
complete -o default -W "${SSH_COMPLETE[*]}" ssh

# Make $HOME comfy
if [ ! -d "${HOME}/bin" ]; then
   mkdir ${HOME}/bin
   chmod 700 ${HOME}/bin
   echo "${HOME}/bin was missing.  I recreated it for you."
fi
if [ ! -d "${HOME}/Documents" ]; then
   if ! [  -d "${HOME}/data" ]; then
       mkdir ${HOME}/data
       chmod 700 ${HOME}/data
       echo "${HOME}/data was missing.  I recreated it for you."
   fi
fi
if [ ! -d "${HOME}/tmp" ]; then
   mkdir ${HOME}/tmp
   chmod 700 ${HOME}/tmp
   echo "${HOME}/tmp was missing.  I recreated it for you."
fi




rc.start()
{
  for arg in $*; do
    sudo /etc/rc.d/$arg start
  done
}
rc.stop()
{
  for arg in $*; do
    sudo /etc/rc.d/$arg stop
  done
}
rc.restart()
{
  for arg in $*; do
    sudo /etc/rc.d/$arg restart
  done
}
rc.reload()
{
  for arg in $*; do
    sudo /etc/rc.d/$arg reload
  done
}


extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


quiet(){
  nohup $1 &>/dev/null &
}
complete -A command quiet


function mkmine() { sudo chown -R ${USER} ${1:-.}; }
function rot13 () { echo "$@" | tr a-zA-Z n-za-mN-ZA-M; }
alias forcast='wget -q -O - http://feeds.bbc.co.uk/weather/feeds/rss/5day/id/1671.xml | grep title | sed -e "s/<[^>]*>//g" -e "s/°//g" | sed -e "s/&#xB0;//g" | egrep "^[A-Z]"'
function mkivr() { sox -v .95 "$1" -r 8000 -U -b 8 -c 1 "$2"; }

# Alias to multiple ls commands

# ALIAS'S OF ALL TYPES SHAPES AND FORMS ;)
#######################################################



# Alias's to modified commands
alias vlc-notrans='killall xcompmgr && vlc && xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &'
alias mktrans='xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &'
alias ps='ps auxf'
alias home='cd ~'
alias pg='ps aux | grep'  #requires an argument
alias un='tar -zxvf'
alias tar='tar -x'
alias mountedinfo='df -hT | grep sda'
alias ping='ping -c 10'
alias du1='du -h --max-depth=1 || tail -n 1'
alias ebrc='pico ~/.bashrc'
alias urxvt='urxvt -depth 32 -fg white -bg rgba:0000/0000/0000/bbbb'
alias mntdynatron='sshfs dynatron:/ dynatron'
alias digger='dosbox ~/bin/DIGGER.EXE'
# system stuff
alias barroman='ssh loserone@barroman.gibson.org.uk'
alias inversed='ssh userone@inversed.org'
alias reboot='sudo reboot'
alias update='sudo yaourt -Syyu'
alias install='sudo yaourt -S'
alias uninstall='sudo pacman -Rcs'
alias search='sudo pacman -Ss'
alias cleanup='sudo pacman -Sycc'
alias conkpac='sudo pacman -Syup --noprogressbar > /home/loserone/tmp/updates.log'
alias opendns='sudo /home/loserone/scripts/opendns'
alias qwerty='setxkbmap gb'
alias dvorak='setxkbmap dvorak gb'
alias poweroff='sudo poweroff'
alias suspend='sudo /usr/sbin/pm-suspend'

#catch editor stuff
#alias nano='nano -w'
alias cpuinfo='cat /proc/cpuinfo'
alias la='ls -Al'               # show hidden files
alias ls='ls -F --color=always' # add colors and file type extensions
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'              # sort by change time
alias lu='ls -lur'              # sort by access time
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lm='ls -al |more'         # pipe through 'more'

# Alias chmod commands
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

# Alias Shortcuts to graphical programs.
alias opera='opera 2>/dev/null &'
alias pidgin='pidgin 2>/dev/null &'

#######################################################

# To temporarily bypass an alias, we preceed the command with a \
# EG:  the ls command is aliased, but to use the normal ls command you would
# type \ls

# WELCOME SCREEN
#######################################################

#mountedinfo ;
#######################################################
#xmodmap /etc/X11/Xmodmap

alias rahfish='ssh l1@dynatron'
export TERM=rxvt
export EDITOR=nano
