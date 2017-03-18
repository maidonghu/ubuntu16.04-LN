sudo apt-get install apache2  -y
sudo wget -O /etc/apache2/apache2.conf https://raw.githubusercontent.com/maidonghu/ubuntu16.04-LN/master/apache2.conf
sudo wget -O /etc/apache2/mods-available/mpm_prefork.conf https://raw.githubusercontent.com/maidonghu/ubuntu16.04-LN/master/mpm_prefork.conf
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo systemctl restart apache2

sudo ufw allow "Apache Full"
sudo wget -O /etc/apache2/sites-available/linode.mikecloud.info.conf  https://raw.githubusercontent.com/maidonghu/ubuntu16.04-LN/master/linode.mikecloud.info.conf
sudo mkdir -p /var/www/html/linode.mikecloud.info/{public_html,logs}
sudo a2ensite linode.mikecloud.info.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2

export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get install -y -q mysql-server
sudo mysql -sfu root < "mysql_secure_installation.sql"
rm -f mysql_secure_installation.sql
sudo systemctl restart mysql

sudo apt-get install php7.0 php-pear libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php7.0-cgi php7.0-GD -y
sudo wget -O /etc/php/7.0/apache2/php.ini  https://raw.githubusercontent.com/maidonghu/ubuntu16.04-LN/master/php.ini
sudo mkdir /var/log/php
sudo chown www-data /var/log/php

sudo mysql -sfu root < "wordpress.sql"
rm -f wordpress.sql
sudo mkdir /var/www/html/linode.mikecloud.info/src/
cd /var/www/html/linode.mikecloud.info/src/
sudo chown -R www-data:www-data /var/www/html/linode.mikecloud.info/
sudo wget http://wordpress.org/latest.tar.gz
sudo -u www-data tar -xvf latest.tar.gz
sudo mv latest.tar.gz wordpress-`date "+%Y-%m-%d"`.tar.gz
sudo mv wordpress/* ../public_html/
sudo chown -R www-data:www-data /var/www/html/linode.mikecloud.info/public_html

sudo a2enmod ssl
sudo systemctl restart apache2
