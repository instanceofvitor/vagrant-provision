#!/bin/bash

echo "Provisioning virtual machine ..."

echo "Updating distro ..."
sudo apt-get update
sudo apt-get upgrade -y

echo "Installing apache"
sudo apt-get install apache2

echo "Installing mysql"
export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password rootpw"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password rootpw"
sudo apt-get install -y mysql-server-5.6
mysql_secure_installation

echo "Installing php 5.6 ..."
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php5-5.6
sudo apt-get update
sudo apt-get install -y php5