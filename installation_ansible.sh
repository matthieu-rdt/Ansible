# update packages
sudo apt update ; sudo upgrade

# Installing pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

# pip install zabbix-api
python3 -m pip install zabbix-api

# install the community zabbix
ansible-galaxy collection install community.zabbix

## etc ansible hosts
[servers]
...

[all:vars]
ansible_python_interpreter=/usr/bin/python3

# setting up ssh keys
mkdir -p $HOME.ssh ; chmod 0700 $HOME.ssh
ssh-keygen -t rsa -b 4096 -C "zabbix-760"

ssh-copy-id -i $HOME.ssh/id_rsa.pub zabbix@172.25.160.141

### PATH=/home/stltools/:.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
### export PATH

# pour utiliser zabbix comme utilisateur sur la machine distante
ansible -m ping all -u zabbix
