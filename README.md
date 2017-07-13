# My Home (Ubuntu 16.04 LTS minimal)

This is a repo for my personal shell with zsh, tmux, vim, git and many other usefull tools for my workspace on linux

# Requires:

http://archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/current/images/netboot/mini.iso

sudo apt install -y openssh-server zsh tmux vim git python htop iftop bmon tcpdump rsync pastebinit screen iproute resolvconf build-essential bzip2 less unzip curl nmap fail2ban lsof pwgen dnsutils ntp xclip ncdu xclip lynx ipcalc ruby tig fuse

# Aditional Tools:
```
sudo apt install -y open-vm-tools # if vm
sudo gem install net-ssh
sudo gem update
git clone https://github.com/OnkelDom/myhome.git
```
# Symlink after pull/clone:
```
ln -s ~/myhome/.gitconfig ~/.gitconfig
ln -s ~/myhome/.gitmodules ~/.gitmodules
ln -s ~/myhome/.vimrc ~/.vimrc
ln -s ~/myhome/.vim ~/.vim
ln -s ~/myhome/.zsh/
ln -s ~/myhome/.zshenv ~/.zshenv
ln -s ~/myhome/.zshrc ~/.zshrc
ln -s ~/myhome/.tmux.conf ~/.tmux.conf
ln -s ~/myhome/bin ~/bin
```
# Change Shell
```
sudo vim /etc/passwd
:%s/\/bin\/bash/\/bin\/zsh/g
relog
```
# Install Docker-CE, Docker-Compose and Docker-Machine
 
Links: https://docs.docker.com/compose/install/ | https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/
```
# Docker-CE
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt install docker-ce
# Docker-Compose
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose &&
chmod +x /tmp/docker-compose &&
sudo cp /tmp/docker-compose /usr/local/bin/docker-compose
# Docker-Machine
curl -L https://github.com/docker/machine/releases/download/v0.12.1/docker-machine-`uname -s`-`uname -m` > /tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
docker --version
docker-compose --version
docker-machine --version
```
# rclone Install, Config and Mount
 
sudo vim /etc/fuse.conf
```
mount_max = 1000
user_allow_other
```
## Fetch and unpack rclone

Links: https://rclone.org/install/ | https://rclone.org/commands/rclone_mount/ | https://rclone.org/drive/
```
# Download files
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
cd rclone-*-linux-amd64
# Copy binary file
sudo cp rclone /usr/bin/
sudo chown root:root /usr/bin/rclone
sudo chmod 755 /usr/bin/rclone
# Install manpage
sudo mkdir -p /usr/local/share/man/man1
sudo cp rclone.1 /usr/local/share/man/man1/
sudo mandb
# Configure rclone
sudo mkdir /mnt/google
sudo chown onkeldom:onkeldom /mnt/google
rclone config
1. create the connection to google
2. create crypted folder
# Copy and start systemd file
sudo cp -R ~/.config /root
sudo cp rclonemount.service /etc/systemd/system/
sudo systemctl enable rclonemount.service
sudo systemctl start rclonemount.service
```
rclone config docs for more details.
