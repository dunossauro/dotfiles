yay -S paru-bin
paru -R yay

# Uninstall rebornos packages

paru -R rebornos-cosmic-common rebornos-cosmic-gnome rebornos-cosmic-full-lts-base rebornos-keyring rebornos-os-release rebornos-welcome rebornos-logo rebornos-lightdm-gtk-greeter-images rebornos-mirrorlist rebornos-cosmic-graphic rebornos-update-rmirrors pamac-aur gufw pavucontrol

# Uninstall gnome stuff
paru -R gnome-terminal gnome-weather gnome-books gnome-maps gnome-music gnome-photos gnome-clocks gnome-contacts evolution gnome-firmware gnome-logs gnome-documents rhythmbox totem

# Work
paru -S blender kdenlive gimp inkscape darktable enve-git obs-studio-tytan652 v4l2loopback-dkms

# Programming
paru -S emacs terminator dbeaver docker docker-compose lazydocker-bin act scrcpy

# Common
paru -S marktext-bin libreoffice-fresh libreoffice-fresh-pt-br

# Python

paru -S pyenv

# Life

paru -S telegram-desktop ytmdesktop-bin

# Browsers

paru -S brave-bin firefox firefox-i18n-pt-br firefox-developer-edition firefox-developer-edition-i18n-pt-br google-chrome

# Audio
paru -S ardour calf yoshimi helvum carla vital-synth

## Audio brigdes
paru -S carla-bridges-win32 carla-bridges-win64 wine

# Pipewire
paru -S pipewire pipewire-alsa pipewire-pulse pipewire-jack pipewire-docs xdg-desktop-portal xdg-desktop-portal-gtk wireplumber pipewire-v4l2

systemctl --user mask pulseaudio
systemctl --user enable pipewire pipewire-pulse

# Addind pipewire by default on jack system
## Work for carla and ardor use pipewire by default
### https://feaneron.com/2020/12/07/switching-to-pipewire/

sudo touch etc/ld.so.conf.d/pipewire-jack.conf
echo "/usr/lib/pipewire-0.3/jack" > /etc/ld.so.conf.d/pipewire-jack.conf
sudo ldconfig
systemctl --user enable pipewire.service pipewire-pulse.service

# System
paru -S bat exa

# Fixies

sudo downgrade mesa # Version 21.2.5 to Blender works
## Interface only works on new versions
paru -S linux linux-headers
paru -R linux-lts linux-lts-headers
sudo grub-mkconfig -o /boot/grub/grub.cfg
