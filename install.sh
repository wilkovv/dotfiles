#!/bin/bash

if [[ ! -d "$HOME/.config/zsh" ]]
then
	mkdir $HOME/.config/zsh
fi

git clone https://github.com/romkatv/powerlevel10k $HOME/.config/zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting  $HOME/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting  $HOME/.config/zsh/zsh-syntax-highlighting-master

