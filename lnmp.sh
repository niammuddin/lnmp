#!/bin/bash

apt-get update
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0x8b3981e7a6852f782cc4951600a6f0a3c300ee8c
echo 'deb http://ppa.launchpad.net/nginx/stable/ubuntu precise main' >> /etc/apt/sources.list
echo 'deb-src http://ppa.launchpad.net/nginx/stable/ubuntu precise main' >> /etc/apt/sources.list

apt-get update
apt-get install nginx

cp default.conf.txt default.conf
mv -f default.conf /etc/nginx/sites-available/default

apt-get install mysql-server
mysql_install_db
/usr/bin/mysql_secure_installation

apt-get install php5-fpm php5-mysql
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xad829e29a018baf8c3842fb080e7349a06ed541c
echo 'deb http://ppa.launchpad.net/nijel/phpmyadmin/ubuntu precise main' >> /etc/apt/sources.list
echo 'deb-src http://ppa.launchpad.net/nijel/phpmyadmin/ubuntu precise main' >> /etc/apt/sources.list

apt-get update
apt-get install phpmyadmin
cd /usr/share/nginx/html -y
sudo ln -s /usr/share/phpmyadmin

echo "Sukses!"
