## mostly based on oh-my-zsh by Robby Russell and agnoster by Isaac Wolkerstorfer
DEFAULT_USER=`whoami`

#plugins=(safe-paste zsh-syntax-highlighting z)
#ZSH_THEME="agnoster-linkz57"
export ZSH="$HOME/.zsh"
#source $ZSH/oh-my-zsh.sh

source $ZSH/oh-my-zsh/plugins/safe-paste/safe-paste.plugin.zsh
source $ZSH/oh-my-zsh/plugins/z/z.sh

source $ZSH/themes/agnoster-minor_edits_by_linkz57.zsh-theme


#for aliases in $ZSH/aliases; do
#	source $aliases
#done
#
#for functionz in $ZSH/functions; do
#	source $functionz
#done

source $ZSH/aliases/*
source $ZSH/functions/*



## oh-my-zsh does a bunch of stuff in a specific order to get everything working together. For this and probably other reasons I can't get my slightly modified agnoster theme to work with this current .zshrc setup. Oddly enough zsh-syntax-highlighting works fine, despite being (I think) the only thing here requiring a specific order. Even so, I'll put at the end here as requested.


source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
