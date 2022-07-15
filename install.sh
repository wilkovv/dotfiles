#!/bin/bash

# Not installing git because it is required to pull this script anyways

sudo dnf update
sudo dnf upgrade
sudo dnf install \
	firefox \
	sway \
	waybar \
	fontawesome-fonts \
	dunst \
	neofetch \
	vim \
	wget \
	alacritty \
	exa \
	zsh \
	grim \
	rofi \
	pavucontrol \
	NetworkManager-tui \
	wl-clipboard


if [[ ! -d "$HOME/.config/zsh" ]]
then
	mkdir $HOME/.config/zsh
fi

git clone https://github.com/romkatv/powerlevel10k $HOME/.config/zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions  $HOME/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting  $HOME/.config/zsh/zsh-syntax-highlighting-master

sudo usermod --shell /bin/zsh wilkow

cp /usr/share/background/sway/Sway_Wallpaper_Blue_1920x1080.png ~/Pictures/Wallpapers/Sway-Wallpaper.png

if [[ ! -d "$HOME/.local/share/fonts" ]]
then
	mkdir $HOME/.local/share/fonts
fi

cd $HOME/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
cd -




