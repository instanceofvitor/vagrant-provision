#!/bin/bash

echo "Provisioning virtual machine ..."

echo "Updating distro ..."
sudo apt-get update
sudo apt-get upgrade -y

echo "Installing apache"
sudo apt-get install apache2
sudo a2enmod rewrite
sudo a2enmod expires
sudo a2enmod headers
sudo cp /var/www/provision/apache2/000-default.conf /etc/apache2/sites-enabled/

echo "Installing mysql"
export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password rootpw"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password rootpw"
sudo apt-get install -y mysql-server-5.6
mysql_secure_installation
#mysql -prootpw -u root < /var/www/provision/mysql/setup.sql
#mysql -prootpw -u root < db.sql

echo "Installing php 5.6 ..."
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php5-5.6
sudo apt-get update
sudo apt-get install -y php5
sudo apt-get install php5-mysql
sudo apt-get install php-apc

echo "Restarting apache"
sudo service apache2 restart

echo "Dev packages"
sudo apt-get install php5-xdebug