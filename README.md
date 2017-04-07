# (linux) My Home

# Requires:

http://archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/current/images/netboot/mini.iso

 * tmux
 * zsh
 * vim
 * ssh-agent

# Aditional Tools:
sudo apt install -y open-vm-tools # if vm

sudo apt install -y openssh-server zsh tmux vim git python # required for this home

sudo apt install -y htop iftop bmon tcpdump rsync iperf pastebinit screen iproute resolvconf build-essential bzip2 less unzip curl nmap iostat fail2ban lsof pwgen dnsutils ntp # optional 

git clone https://github.com/OnkelDom/myhome.git

# Symlink after pull/clone:

 * ln -s ~/myhome/.gitconfig ~/.gitconfig
 * ln -s ~/myhome/.vimrc ~/.vimrc
 * ln -s ~/myhome/.vim ~/.vim
 * ln -s ~/myhome/.zsh/
 * ln -s ~/myhome/.zshenv ~/.zshenv
 * ln -s ~/myhome/.zshrc ~/.zshrc
 * ln -s ~/myhome/.gitmodules ~/.gitmodules
 * ln -s ~/myhome/bin ~/bin
 
 sudo vim /etc/passwd | shell -> /bin/zsh
 
 reload / relog
