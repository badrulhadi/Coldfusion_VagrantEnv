#!/usr/bin/env bash

# Install mysql if it is not install
if dpkg --list mysql* | egrep -q ^ii; then
    echo "MySQL is installed!"
else
    debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
    debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
    sudo apt-get update
    sudo apt-get install -y mysql-server
fi

# Start Coldfusion Application Server
sudo /vagrant/ColdFusion/cfusion/bin/cfstart.sh
