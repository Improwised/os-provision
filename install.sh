# Prepare pacman
sudo mkdir -p /root/.gnupg
sudo pacman-key --init && sudo pacman-key --populate archlinux manjaro && sudo pacman-key --refresh-keys

# Remove packages

# Upgrade all
sudo pacman -Syyu

# Install zsh & oh-my-zsh
sudo pacman -S --noconfirm git zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s $(which zsh)
# Do logout & login

# Install official packages
# latte-dock
sudo pacman -S --noconfirm openssh tk nethogs docker vim synapse samba \
  alacritty dbeaver baobab simple-scan yay firefox htop peek vlc feh patch make fakeroot


# Install community packages
yay --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu --save --sudoloop --stats --nocombinedupgrade --batchinstall \
  brother-mfc-7860dw brscan4 concourse-fly-bin fluxctl-bin gitflow-avh google-chrome kubectl-bin peazip-qt kde-servicemenus-peazip \
  rslsync slack-desktop sublime-text-dev fasd

# Install custom softwares


# Enable docker without sudo
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl enable docker
sudo systemctl start docker
newgrp docker

# Gnome settings
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.shell enabled-extensions 'elementary'
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
