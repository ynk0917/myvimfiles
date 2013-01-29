# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
xset b off
export AWT_TOOLKIT=MToolkit
export PATH=$PATH:~/mybin:~/mybin/ars:~/libs/p4v/bin:~/libs/android-sdk-linux/tools:~/libs/android-sdk-linux/platform-tools:~/mybin/psdtool-0.1-Linux/psdhtml
alias ..='cd ..'
alias ...='cd ../..'
alias a='ant'
alias c='cd -P'
alias f='find'
alias g='grep -i'
alias h='history'
alias l='ls -lh'
alias o='popd'
alias p='pushd'
alias gvim="gvim -reverse 2>/dev/null"
alias tvim="gvim --servername localhost ---remote-silent-tab 2>/dev/null"
alias m10parser="java -jar ~/libs/M10Parser.jar"
alias grep="grep --color"
alias bootloader="adb reboot-bootloader"
alias pwd="pwd -P"
alias logcat="adb logcat -v time"
alias top="htop"
alias ever_host_ssh="ssh nienkun@10.5.37.225"
alias preprocess_setting="java -jar ~/mybin/Preprocess.jar"
alias axml_parser="java -jar ~/mybin/AXMLPrinter2.jar"
alias htc_ant="htc_ant_clean.sh && htc_ant.sh"
alias xterm="xterm -tn xterm-256color -fa 'Monaco:pixelsize=18'"
function goto_bin_directory() {
    pushd `which $1 | xargs dirname`
}


# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
set -o vi
# If id command returns zero, youve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\W #\\[$(tput sgr0)\\]"
else # normal
  PS1="[\033[1;32m\]\u@\h:\W] \[\033[30m\]]\[\033\0m\]>"
fi
#PS1="${debian_chroot:+($debian_chroot)}\[33[01;32m\]\u@\h\[33[00m\]:\[33[01;34m\]\w\[33[00m\]\$ "
#PS1="\[\033[42m\]\[\033[30m\][\[\033[31m\]\u@\[\033[1;33m\]\h:\[\033[1;35m\]\W,\[\033[1;34m\] \@,\[\033[1;37m\]\d\[\033[30m\]]\[\033[0m\]>"
source ~/mybin/and3_connect.sh
function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    days_since_last_commit=$((hours_since_last_commit/24));
    hours_since_last_commit=$((hours_since_last_commit%24));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    
    echo "${days_since_last_commit}d${hours_since_last_commit}h${minutes_since_last_commit}m ";
}
PS1="\[\033[30m\][\[\033[1;35m\]\u@\[\033[1;33m\]\W\[\033[30m\]]\[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\] >"
export TERM=xterm-256color

if [ -e ~/.vim/bundle/android-completion/android ] ; then
    source ~/.vim/bundle/android-completion/android
fi
