# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

## version 3.0

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## thanks to Chris Marshall AKA codegoalie for this alert alias
## https://gist.github.com/codegoalie/975690/82d6198b65fdf00c84f93e01f7e6cdb2f22fe524
## Add an "alert" alias for long running commands.  Use like so:
##   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias notify='alert'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi




################
## custom add ##
################

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls --color=always -Flah'
alias d='date +%Y-%m-%d_%H-%M'
alias t='\date +%H:%M'
alias ssh='ssh -o VisualHostKey=yes'
alias count='wc -l'
alias df='df -x squashfs'
alias powershell='pwsh'
alias password="strings -es < /dev/urandom | head | tr -cd '[[:alnum:]]._-' ; printf '\n'"
alias ansb='mount | grep toor@ansible:/etc/ansible || sshfs toor@ansible:/etc/ansible /home/tfrancis/mounts/ansible ; code /home/tfrancis/mounts/ansible ; ssh toor@ansible'
#alias apt='apt --verbose-versions'
export PATH=~/Documents/sjunk/morepath:~/Documents/sjunk/scripts:$PATH
export SUDO_EDITOR=/usr/bin/kate
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export LC_ALL=en_US.UTF-8



## Thanks to Daniel Weibel at https://gist.github.com/weibeld/f3b6e6187029924a9b3d
## for giving an exit code before my prompt, without having to run Byobu.

# Set a Bash prompt that includes the exit code of the last executed command.
#
# Setup: paste the content of this file to ~/.bashrc, or source this file from
# ~/.bashrc (make sure ~/.bashrc is sourced by ~/.bash_profile or ~/.profile)
#
# Daniel Weibel <danielmweibel@gmail.com> October 2015
#------------------------------------------------------------------------------#
export PROMPT_COMMAND=set_prompt

set_prompt() {
  # Capture exit code of last command
  local ex=$?

  #----------------------------------------------------------------------------#
  # Bash text colour specification:  \e[<STYLE>;<COLOUR>m
  # (Note: \e = \033 (oct) = \x1b (hex) = 27 (dec) = "Escape")
  # Styles:  0=normal, 1=bold, 2=dimmed, 4=underlined, 7=highlighted
  # Colours: 31=red, 32=green, 33=yellow, 34=blue, 35=purple, 36=cyan, 37=white
  #----------------------------------------------------------------------------#
  local color='\e[38;5;202m'
#  local reset='\e[0m'

  # Set prompt content
#  PS1="\u@\h:\w$\[$reset\] "


## thanks to eranga bandara for the following git branch function and the subsequent PS1 inclusion
## https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


## I don't like green as much as Mr. Weibel, so I'm going to steal and modify Byobu's $PS1
  if hostname | grep tfrancis-dell >/dev/null ; then
	PS1="${debian_chroot:+($debian_chroot)}\[\e[31m\]\[\e[38;5;245m\]\u\[\e[00m\]@\[\e[38;5;3$(( $RANDOM * 6 / 32767 + 1 ))m\]\h\[\e[00m\]:\[\e[00;36m\]\w\[\e[38;5;3m\]\$(parse_git_branch)\[\e[00m\] "
  else
	PS1="${debian_chroot:+($debian_chroot)}\[\e[31m\]\[\e[38;5;245m\]\u\[\e[00m\]@\[\e[38;5;3m\]\h\[\e[00m\]:\[\e[00;36m\]\w\[\e[38;5;3m\]\$(parse_git_branch)\[\e[00m\] "
  fi
  # If exit code of last command is non-zero, prepend this code to the prompt
  [[ "$ex" -ne 0 ]] && PS1="$ex $PS1"
  # Set colour of prompt
  PS1="\[$color\]$PS1"
  
  
}

