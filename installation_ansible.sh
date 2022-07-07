echo "update packages"
sudo apt-get update ; sudo upgrade

echo "Installing pip then ansible"
sudo apt-get install python-pip
pip install ansible
