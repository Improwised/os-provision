# Prepare pacman
# sudo mkdir -p /root/.gnupg
# sudo pacman-key --init && sudo pacman-key --populate archlinux manjaro && sudo pacman-key --refresh-keys

# Remove packages

# Install zsh & oh-my-zsh
sudo pacman -S --noconfirm git zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s $(which zsh)
# Do logout & login

# Upgrade all
sudo pacman -Syyu

# Install official packages
# latte-dock
sudo pacman -S --noconfirm base-devel openssh tk nethogs docker docker-compose \
  alacritty dbeaver baobab simple-scan yay firefox htop peek flameshot vlc feh \
  patch make fakeroot m4 nuspell xclip vim synapse samba fasd gitui libinput xdotool


# Install community packages
yay -S \
  brother-mfc-7860dw brscan4 concourse-fly-cli fluxctl-bin gitflow-avh google-chrome kubectl-bin peazip-qt-bin \
  rslsync slack-desktop sublime-text-4 ttf-ms-fonts ruby-fusuma

# Install custom softwares


# Enable docker without sudo
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl enable docker
sudo systemctl start docker
newgrp docker

# Post-install Optimizations
# Reduce GRUB timeout
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo update-grub
# Reduce swappiness to 10 performance improvement in systems with large RAM
sudo tee -a /etc/sysctl.d/100-manjaro-custom.conf > /dev/null << EOF
vm.swappiness=10
EOF
# Switch to Xorg by default
sudo sed -i 's/WaylandEnable=true/WaylandEnable=false/' /etc/gdm/custom.conf

# Gnome settings
# gsettings set org.gnome.desktop.interface clock-show-date true
# gsettings set org.gnome.shell enabled-extensions 'elementary'
# gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

# Printer
#Cups systemd socket and service files have been
#sudo systemctl start org.cups.cupsd
sudo systemctl enable cups.service
sudo systemctl start cups.service
sudo lpadmin -p MFC7860DW -E -v socket://10.0.1.10 -P /usr/share/cups/model/MFC7860DW.ppd
sudo brsaneconfig4 -a name=Brother_MFC7860DW model=MFC-7860DW ip=10.0.1.10
