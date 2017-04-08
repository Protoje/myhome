# (linux) My Home

# Requires:

http://archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/current/images/netboot/mini.iso

sudo apt install -y openssh-server zsh tmux vim git python # required for this home

# Aditional Tools:
sudo apt install -y open-vm-tools # if vm

sudo apt install -y htop iftop bmon tcpdump rsync iperf pastebinit screen iproute resolvconf build-essential bzip2 less unzip curl nmap fail2ban lsof pwgen dnsutils ntp xclip ncdu # optional

sudo apt install ruby

sudo gem install net-ssh

sudo gem update

git clone https://github.com/OnkelDom/myhome.git

git clone *workspaces*

# Symlink after pull/clone:

 * ln -s ~/myhome/.gitconfig ~/.gitconfig
 * ln -s ~/myhome/.gitmodules ~/.gitmodules
 * ln -s ~/myhome/.vimrc ~/.vimrc
 * ln -s ~/myhome/.vim ~/.vim
 * ln -s ~/myhome/.zsh/
 * ln -s ~/myhome/.zshenv ~/.zshenv
 * ln -s ~/myhome/.zshrc ~/.zshrc
 * ln -s ~/myhome/.tmux.conf ~/.tmux.conf
 * ln -s ~/myhome/bin ~/bin
 
 sudo vim /etc/passwd | shell -> /bin/zsh
 
 reload / relog
