#!/bin/bash

# Datei zum erstellen der myhome gegebenheiten
sudo apt install -y git
cd ~
git clone https://github.com/OnkelDom/myhome.git

# Check ob System virtuel
if [ /proc/cpuinfo | grep hypervisor ]; then
sudo apt install -y open-vm-tools
fi

# Installieren aller Tools
sudo apt install -y openssh-server zsh tmux vim python htop iftop bmon tcpdump rsync iperf pastebinit screen iproute resolvconf build-essential bzip2 less unzip curl nmap fail2ban lsof pwgen dnsutils ntp xclip ncdu mcabber xclip lynx ipcalc ruby sed awk
sudo gem install net-ssh
sudo gem update

# Git Clone Foundation
cd ~
git clone https://p13sp36@bitbucket.dvag.com/scm/sa/foundation.git

# Add yamllint and lync aliases
cd ~
echo "alias yamllint='yamllint -f parsable -c ~/foundation/hieradata/.yamllint'" >> .bashrc
echo "alias lynx='lynx -accept_all_cookies'" >> .bashrc

# Anlegen der Symlinks
ln -s ~/myhome/.gitconfig ~/.gitconfig
ln -s ~/myhome/.gitmodules ~/.gitmodules
ln -s ~/myhome/.vimrc ~/.vimrc
ln -s ~/myhome/.vim ~/.vim
ln -s ~/myhome/.zsh/
ln -s ~/myhome/.zshenv ~/.zshenv
ln -s ~/myhome/.zshrc ~/.zshrc
ln -s ~/myhome/.tmux.conf ~/.tmux.conf
ln -s ~/myhome/bin ~/bin
ln -s ~/myhome/.mcabber ~/.mcabber

# Ersetzen der Shell

# Reboot
sudo reboot
