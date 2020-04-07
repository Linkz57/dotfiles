## mostly based on oh-my-zsh by Robby Russell and agnoster by Isaac Wolkerstorfer
DEFAULT_USER=`whoami`

#plugins=(safe-paste zsh-syntax-highlighting z)
#ZSH_THEME="agnoster-linkz57"
export ZSH="~/.zsh"
#source $ZSH/oh-my-zsh.sh

source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/oh-my-zsh/plugins/safe-paste/safe-paste.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/z/z.sh

source ~/.zsh/themes/agnoster-minor_edits_by_linkz57.zsh-theme


for aliases in $ZSH/aliases; do
	source $aliases
done

for functionz in $ZSH/functions; do
	source $functionz
done
