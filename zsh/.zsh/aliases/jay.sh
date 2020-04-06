alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls --color=always -Flah'
#alias d='date +%Y-%m-%d_%H-%M'
#alias t='\date +%H:%M'
alias ssh='ssh -o VisualHostKey=yes'
alias count='wc -l'
alias df='df -x squashfs -x tmpfs'
alias powershell='pwsh'
alias password="strings -es < /dev/urandom | head | tr -cd '[[:alnum:]]._-' ; printf '\n'"
alias passwordl="echo $(password) | tr '[:upper:]' '[:lower:]'"
alias passwordn="echo $(password) | grep -E '[[:digit:]]' --color=always"
alias lsblk='\lsblk | grep -v "/snap/"'
alias note='/home/tfrancis/Documents/sjunk/scripts/new_tomboy_note.py'
alias toilet='\toilet -w $COLUMNS'
alias py='bpython'

## thanks to Chris Marshall AKA codegoalie for this alert alias
## https://gist.github.com/codegoalie/975690/82d6198b65fdf00c84f93e01f7e6cdb2f22fe524
## Add an "alert" alias for long running commands.  Use like so:
##   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias notify='alert'
