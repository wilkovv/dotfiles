
HISTFILE=~/.cache/.histfile
HISTSIZE=1000
SAVEHIST=1000

#End of lines configured by zsh-newuser-install
#
autoload -U colors && colors
PS1='%B%F{blue}[%n@%m%F{white}:%1~%F{blue}]%F{white}%b$'

#Load completion of commands
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

alias ls='exa --icons'
alias ll='exa -l --icons'
alias ip='ip --color=auto'
alias git-dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 

# Powerlevel10k prompt
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# Syntax highlighting
source ~/.config/zsh/zsh-syntax-highlighting-master/zsh-syntax-highlighting.zsh

#Autosuggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run 'p10k configure' or edit ~/.p10k.zsh
[[ ! -f ~/.config/zsh/powerlevel10k/.p10k.zsh ]] || source ~/.config/zsh/powerlevel10k/.p10k.zsh 
