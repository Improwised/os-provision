# OS Provisioning Scripts for Computers

This repo is a template to provision [Gnome Edition of Manjaro](https://manjaro.org/downloads/official/gnome/) linux distribution to look and work as we want it to, with all the necessary software installed.

## Manjaro

### Installation

The [First Steps](https://manjaro.org/support/firststeps/) guide is a good resource to install Manjaro. We recommend that you create a separate partition for `/home` to keep your work data separate from the OS volume.

### Tips

* Enable and use AUR (`yay` should enable AUR first time it runs) to install third-party software you need. It has wide range of packages available for almost everything you're going to need.
* Recommended Software - all of them should be installed once the script is run:
  * Editor: Sublime Text
  * Browser: Firefox and Google Chrome
  * Communication: Slack
  * Terminal: Gnome Terminal (built-in). Alternatively, Alacritty and Kitty are good.
  * Database UI: DBeaver
  * Docker
  * `git` and `git flow`
  * Screen Recording: Peek
  * Screenshots: Flameshot


## Features

* AUR and yay
* Desktop applications
* Alacritty + Oh-my-zsh
* Other dotfiles and misc stuff

### Bash

```shell
wget https://raw.githubusercontent.com/Improwised/os-provision/master/install.sh -O - | zsh
```

or

```shell
git clone https://github.com/improwised/os-provision.git
cd os-provision
./install.sh
```

### Ansible

```shell
## Running in local
## Exclude devops, developer tools and pacman -Syu
ANSIBLE_SKIP_TAGS='devops,developer,syu,sssd' ansible-playbook -i localhost --connection=local playbook.yml -K -vvv
```

### Test Ansible through vagrant

```bash
vagrant up
```
