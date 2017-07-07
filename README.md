# (linux) My Home (Ubuntu 16.04 LTS minimal)

This is a repo for my personal shell with zsh, tmux, vim, mcabber, git and many other usefull tools for my workspace on linux

# Requires:

http://archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/current/images/netboot/mini.iso

sudo apt install -y openssh-server zsh tmux vim git python mcabber htop iftop bmon tcpdump rsync pastebinit screen iproute resolvconf build-essential bzip2 less unzip curl nmap fail2ban lsof pwgen dnsutils ntp xclip ncdu xclip lynx ipcalc ruby tig clusterssh

# Aditional Tools:
sudo apt install -y open-vm-tools # if vm

sudo gem install net-ssh

sudo gem update

git clone https://github.com/OnkelDom/myhome.git

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
 * ln -s ~/myhome/.mcabber ~/.mcabber
 
 # Change Shell
 sudo vim /etc/passwd

 :%s/\/bin\/bash/\/bin\/zsh/g
 
 relog
 
 # Other Stuff
 # Install Docker-CE and Docker-Compose
 
 Links: https://docs.docker.com/compose/install/ | https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/
 
 sudo apt-get remove docker docker-engine docker.io
 
 sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
 
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 
 sudo apt-key fingerprint 0EBFCD88
 
 sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 
 sudo apt-get update
 
 sudo apt install docker-ce
 
 sudo -i
 
 curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
 
 ctrl+d
 
 sudo chmod +x /usr/local/bin/docker-compose
 
 docker-compose --version
 
 docker --version
 
 # Install Docker Monitoring
 
Tutorial: https://www.brianchristner.io/how-to-setup-docker-monitoring/
 
cAdvisor: http://DockerIP:8083 - User: root | Pass: root

sudo docker run -d -p 8083:8083 -p 8086:8086 --expose 8090 --expose 8099 --name influxsrv tutum/influxdb

InfluxDB: http://DockerIP:8080

sudo docker run --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=8080:8080 --detach=true --link influxsrv:influxsrv --name=cadvisor google/cadvisor:latest -storage_driver_db=influxdb -storage_driver_host=influxsrv:8086

Grafana Metrics Dashboard: http://DockerIP:3000 - User: admin | Pass: Admin

sudo docker run -d -p 3000:3000 -e INFLUXDB_HOST=localhost -e INFLUXDB_PORT=8086 -e INFLUXDB_NAME=cadvisor -e INFLUXDB_USER=root -e INFLUXDB_PASS=root --link influxsrv:influxsrv --name grafana grafana/grafana
