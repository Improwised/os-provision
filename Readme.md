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
git clone --recursive https://github.com/improwised/os-provision.git
cd os-provision
./install.sh
```

### Ansible

* Tags:

  * `init`: (arch) Setting basic things like pacman parallel package download etc.

  * `essential,devops,developer`: (arch) Installing tools for respective profile. you can found list of tools under `ansible/tasks/tools/`

  * `sssd`: setting up sssd

  * `security-hardening`: setting up security-hardening like sshd rules, fail2ban

  * `osqueryd`/`osquery`: setting up osquery daemon

> > **Specify tags that you don't want to execute in `ANSIBLE_SKIP_TAGS`**

```shell
## Running in local
## Exclude devops, developer tools, 'pacman -Syu', sssd, osqueryd
ANSIBLE_SKIP_TAGS='syu,devops,developer,security-hardening,sssd' ansible-playbook -i 127.0.0.1, --connection=local --limit 127.0.0.1 playbook.yml --connection=local -K -vvv
```

Root user `sensei`:`6JHnhVpRm7v8jjoCavryqSdGNAAJB2tn`:`$6$iaRpHufUmAJq0oT9$0sPOKtPZ264WiWrnDmClyRW5W/a03hpQVIhzXwSChKYZ/Tim2IEjsWehPYsLjg.QwKcENmCHVgB3UHd29Hd4R0`

> python -m pip install --user passlib

> python -c "from passlib.hash import sha512_crypt; import getpass; print(sha512_crypt.using(rounds=5000).hash(getpass.getpass()))"

### Test Ansible

```shell
vagrant up
```
