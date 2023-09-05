#!/bin/env bash
# bad code below. sorry, no time for this, will improve later
# stole a huge amount of code from gh0stzk. thanks!


sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com 
sudo pacman-key --lsign-key 3056513887B78AEB 
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e '[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf


sudo pacman -Syy grapejuice lazygit npm neovim fd zoxide bat qt5-quickcontrols2 qt5-graphicaleffects qt5-svg xdg-desktop-portal-xapp gvfs ffmpegthumbnailer tumbler thunar xorg-setxkbmap lsd ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-terminus-nerd ttf-inconsolata ttf-joypixels papirus-icon-theme rofi dunst polybar xorg-xprop xorg-xkill physlock picom bspwm sxhkd xdg-user-dirs xorg-xsetroot xorg-xwininfo xorg-xrandr polkit-gnome adwaita-cursors lxappearance pulsemixer libinput qalculate-gtk breeze-icons qt5ct spotify alacritty p7zip p7zip-gui sddm zip downgrade htop pinta ntfs-3g btrfs-progs cpupower yuzu-early-access grub efibootmgr firefox ttf-liberation ttf-dejavu noto-fonts noto-fonts-emoji noto-fonts-cjk inetutils nvidia-dkms r8168-dkms discord mangohud lib32-mangohud mpv easyeffects steam qbittorrent calf linux-headers nvidia-settings lib32-nvidia-utils nvidia-utils trackma-git git github-cli tachidesk tachidesk-sorayomi-bin kvantum bottles gamemode lib32-gamemode heroic-games-launcher-git thunderbird xdg-user-dirs xdg-desktop-portal paru pipewire pipewire-pulse wireplumber

mv paru/ $HOME/.config/
paru -S alass unified-remote-server sddm-theme-tokyo-night --noconfirm

sudo systemctl enable sddm.service
sudo systemctl enable polkit
sudo mkdir /etc/sddm.conf.d

echo -e '[Autologin]
User=victor
Session=bspwm
[General]
Numlock=on' | sudo tee -a /etc/sddm.conf.d/autologin.conf
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
mkdir ~/.config/xfce4
echo -e 'TerminalEmulator=alacritty' | sudo tee -a ~/.config/xfce4/helpers.rc
sudo mkdir /usr/share/thumbnailers/
echo -e '[Thumbnailer Entry]
TryExec=ffmpeg
Exec=ffmpeg -y -i %i %o -fs %s
MimeType=audio/mpeg' | sudo tee -a /usr/share/thumbnailers/audiocovers.thumbnailer

echo -e 'setxkbmap -model abnt2 -layout br
feh --no-fehbg --bg-fill ~/.wallpaper/wallpaper.jpg
nohup easyeffects --gapplication-service &
/opt/urserver/urserver --daemon &' | sudo tee -a ~/.xprofile

echo -e '[Theme]
Current=tokyo-night-sddm' | sudo tee -a /etc/sddm.conf.d/themes.conf

xdg-mime default thunar.desktop inode/directory

git clone --depth=1 https://github.com/70705/dots.git && cd linux-backup

mv alacritty/ $HOME/.config/
mv bspwm/ $HOME/.config/
mv gtk-2.0/ $HOME/.config/
mv gtk-3.0/ $HOME/.config/
mv gtk-4.0/ $HOME/.config/
mv Thunar/ $HOME/.config/
mv Kvantum/ $HOME/.config/
sudo mv tokyo-night-grub/ /boot/grub/themes/
mv fish/ $HOME/.config/
mv omf/ $HOME/.config/
mv pipewire/ $HOME/.config/
mv .zshrc $HOME/

sudo mkdir /usr/share/Kvantum/ && sudo mv KvArcTokyoNight/ /usr/share/Kvantum/

if [[ $SHELL != "/usr/bin/fish" ]]; then
  echo "Changing shell to fish, your root pass is needed."
  chsh -s /usr/bin/fish


#workspaces() {
#    name=1
#    for monitor in $(bspc query -M); do
#        bspc monitor "${monitor}" -n "$name" -d '1' '2' '3' '4' '5' 
#        bspc monitor ${monitor} -n "$name" -d '6' '7' '8' '9'
#        (( name++ ))
#    done
#}
