#!/bin/env bash
# bad code below. sorry, no time for this, will improve later


sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com 
sudo pacman-key --lsign-key 3056513887B78AEB 
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e '[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf


sudo pacman -Syy lsd ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-terminus-nerd ttf-inconsolata ttf-joypixels papirus-icon-theme rofi dunst polybar xorg-xprop xorg-xkill physlock picom bspwm sxhkd xdg-user-dirs zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting xorg-xsetroot xorg-xwininfo xorg-xrandr polkit-gnome adwaita-cursors lxappearance pulsemixer libinput qalculate-gtk breeze-icons qt5ct xdg-desktop-portal-kde spotify alacritty gwenview p7zip dolphin p7zip-gui sddm zip downgrade htop pinta ntfs-3g catppuccin-gtk-theme-frappe kvantum-theme-catppuccin-git btrfs-progs cpupower yuzu-early-access grub efibootmgr firefox ttf-liberation ttf-dejavu noto-fonts noto-fonts-emoji noto-fonts-cjk inetutils nvidia-dkms networkmanager discord mangohud lib32-mangohud mpv easyeffects steam qbittorrent calf kdeconnect zsh linux-tkg-bmq linux-tkg-bmq-headers nvidia-settings lib32-nvidia-utils nvidia-utils lutris visual-studio-code-bin trackma-git git kvantum bottles ffmpegthumbs freedownloadmanager gamemode lib32-gamemode heroic-games-launcher-git thunderbird xdg-user-dirs xdg-desktop-portal paru pipewire pipewire-pulse wireplumber
paru -S alass --noconfirm


sudo systemctl enable sddm.service
sudo systemctl enable polkit
sudo mkdir /etc/sddm.conf.d


echo -e '[Autologin]
User=victor
Session=bspwm' | sudo tee -a /etc/sddm.conf.d/autologin.conf
echo -e '2048' | sudo tee -a /proc/sys/dev/hpet/max-user-freq
echo -e '2048' | sudo tee -a /sys/class/rtc/rtc0/max_user_freq
echo -e 'BROWSER=firefox
EDITOR=nano
__GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
__GL_THREADED_OPTIMIZATION=1
QT_QPA_PLATFORMTHEME=qt5ct
QT_STYLE_OVERRIDE=kvantum' | sudo tee -a /etc/environment
echo -e '[General]
TerminalApplication=alacritty' | sudo tee -a ~/.config/kdeglobals
echo -e 'Section "InputClass"
	Identifier "My Mouse"
	Driver "libinput"
	MatchIsPointer "yes"
	Option "AccelProfile" "flat"
	Option "AccelSpeed" "0"
EndSection' | sudo tee -a /etc/X11/xorg.conf.d/50-mouse-acceleration.conf


echo -e 'setxkbmap -model abnt2 -layout br
feh --no-fehbg --bg-fill ~/.wallpaper/wallpaper.jpg
nohup easyeffects --gapplication-service &' | sudo tee -a ~/.xprofile

xdg-mime default org.kde.dolphin.desktop inode/directory

git clone --depth=1 https://github.com/70705/linux-backup.git && cd linux-backup

mv alacritty/ $HOME/.config/
mv bspwm/ $HOME/.config/
mv paru/ $HOME/.config/

if [[ $SHELL != "/usr/bin/zsh" ]]; then
  echo "Changing shell to zsh, your root pass is needed."
  chsh -s /usr/bin/zsh


#workspaces() {
#    name=1
#    for monitor in $(bspc query -M); do
#        bspc monitor "${monitor}" -n "$name" -d '1' '2' '3' '4' '5' 
#        bspc monitor ${monitor} -n "$name" -d '6' '7' '8' '9'
#        (( name++ ))
#    done
#}
