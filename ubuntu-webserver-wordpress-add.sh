#!/bin/sh

#DATABASE ARGUMENTS
echo "\e[32mcreate your database Name ...\e[39m"
read DATABASE_NAME
echo "\e[39mdatabase: \e[32m${DATABASE_NAME}\e[39m"

#WORDPRESS ARGUMENTS
echo "\e[32menter the full path for your wordpress installation ...\e[39m"
read INSTALL_PATH

#CERTBOT ARGUMENTS
echo "\e[32mwhat domain name will you use for this wordpress ...\e[39m"
read DOMAIN_NAME

#DATABASE INSTALL
echo "downloading webserver software install script from github ..."
sudo curl -o mysql-database-add.sh https://raw.githubusercontent.com/wjcarey/mysql-database-add/main/mysql-database-add.sh && sudo chmod 777 mysql-database-add.sh && sudo ./mysql-database-add.sh ${DATABASE_NAME}

#CREATE APACHE VIRTUALHOST
echo "downloading webserver config script from github ..."
sudo curl -o apache2-create-virtualhost.sh https://raw.githubusercontent.com/wjcarey/apache2-create-virtualhost/main/apache2-create-virtualhost.sh && sudo chmod 777 apache2-create-virtualhost.sh && sudo ./apache2-create-virtualhost.sh ${INSTALL_PATH} ${DOMAIN_NAME}

#WORDPRESS INSTALL
echo "downloading wordpress install script from github ..."
sudo curl -o wordpress-install.sh https://raw.githubusercontent.com/wjcarey/wordpress-install/master/wordpress-install.sh && sudo chmod 777 wordpress-install.sh && sudo ./wordpress-install.sh ${INSTALL_PATH}

#CERTBOT INSTALL
echo "downloading certbot install script from github ..."
sudo curl -o apache2-certbot.sh https://raw.githubusercontent.com/wjcarey/apache2-certbot/main/apache2-certbot.sh && sudo chmod 777 apache2-certbot.sh && sudo ./apache2-certbot.sh ${INSTALL_PATH} ${DOMAIN_NAME}

echo "success: installation complete ..."
rm -- "$0"
exit
