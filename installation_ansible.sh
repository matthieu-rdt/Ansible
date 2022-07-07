echo "update packages"
sudo apt-get update ; sudo apt-get upgrade

echo "Installing pip then ansible"
sudo apt-get install python3-pip
pip install ansible
