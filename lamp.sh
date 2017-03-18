sudo apt-get install apache2  -y
get /etc/apache2/apache2.conf
get /etc/apache2/mods-available/mpm_prefork.conf
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo systemctl restart apache2

get /etc/apache2/sites-available/linode.mikecloud.info.conf
sudo mkdir -p /var/www/html/linode.mikecloud.info/{public_html,logs}
sudo a2ensite linode.mikecloud.info.conf
sudo a2dissite 000-default.conf
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get install -y -q mysql-server
sudo mysql -sfu root < "mysql_secure_installation.sql"
rm -f mysql_secure_installation.sql
sudo systemctl restart mysql

sudo apt-get install php7.0 php-pear libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php7.0-cgi -y
get /etc/php/7.0/apache2/php.ini

sudo mysql -sfu root < "wordpress.sql"
rm -f wordpress.sql

