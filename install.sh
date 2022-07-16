#!/bin/bash
#
#Script to be launched from dotfiles folder (for now)
#
# Not installing git because it is required to pull this script anyways

sudo dnf update -y
sudo dnf upgrade -y
sudo dnf install -y \
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

# Checking and creating destination folders

mkdir -p "$HOME/.config" || echo '~/.config already exists'
mkdir -p "$HOME/.config/alacritty" || echo '~/.config/alacritty already exists'
mkdir -p "$HOME/.config/dunst" || echo '~/.config/dunst already exists'
mkdir -p "$HOME/.config/sway" || echo '~/.config/sway already exists'
mkdir -p "$HOME/.config/waybar" || echo '~/.config/waybar already exists'
mkdir -p "$HOME/.config/rofi/themes" || echo '~/.config/rofi/themes already exists' 

# Copying dotfiles

cp .p10k.zsh $HOME/
cp .zshrc $HOME/
cp .config/alacritty/alacritty.yml $HOME/.config/alacritty/
cp .config/dunst/dunstrc $HOME/.config/dunst/
cp .config/sway/import-gsettings $HOME/.config/sway/
cp .config/sway/printscreen.sh $HOME/.config/sway/
cp .config/waybar/style.css $HOME/.config/waybar/
cp .config/rofi/config.rasi $HOME/.config/rofi/
cp .config/rofi/themes/gruvbox-blue.rasi $HOME/.config/rofi/themes/

# Instant fixes for QEMU vm's

if [ $(sudo dmidecode -s system-manufacturer) == "QEMU" ]; then
	sed "s/ 1920x1080 / 1600x900 /g" .config/sway/config | sed "s/eDP-1/Virtual-1/g" > $HOME/.config/sway/config
	sed "s/wlp3s0/enp1s0/g" .config/waybar/config > $HOME/.config/waybar/config
	echo 'if [[ -z $DISPLAY && $TTY = /dev/tty1 ]]; then exec sway; fi' > $HOME/.zprofile
else
	cp .config/sway/config $HOME/.config/sway/
	cp .config/waybar/config $HOME/.config/waybar/
fi

# Installing zsh extensions

mkdir -p $HOME/.config/zsh || echo "~/.config/zsh already exists"

git clone https://github.com/romkatv/powerlevel10k $HOME/.config/zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions  $HOME/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting  $HOME/.config/zsh/zsh-syntax-highlighting-master

sudo usermod --shell /bin/zsh $USERNAME

# Setting default wallpaper for sway

mkdir -p $HOME/Pictures/Wallpapers || echo '~/Pictures/Wallpapers already exists'

cp /usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png ~/Pictures/Wallpapers/Sway-Wallpaper.png

# Downloading/Installing MesloLGS fonts for p10k

mkdir -p $HOME/.local/share/fonts || echo '~/.local/share/fonts already exists'

wget -P $HOME/.local/share/fonts/ \
	https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
	https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf \
	https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf \
	https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
