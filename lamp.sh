sudo apt-get install apache2  -y
wget -o /etc/apache2/apache2.conf https://raw.githubusercontent.com/maidonghu/ubuntu16.04-LN/master/apache2.conf
wget -o /etc/apache2/mods-available/mpm_prefork.conf https://raw.githubusercontent.com/maidonghu/ubuntu16.04-LN/master/mpm_prefork.conf
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo systemctl restart apache2

wget -o /etc/apache2/sites-available/linode.mikecloud.info.conf  https://raw.githubusercontent.com/maidonghu/ubuntu16.04-LN/master/linode.mikecloud.info.conf
sudo mkdir -p /var/www/html/linode.mikecloud.info/{public_html,logs}
sudo a2ensite linode.mikecloud.info.conf
sudo a2dissite 000-default.conf
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get install -y -q mysql-server
sudo mysql -sfu root < "mysql_secure_installation.sql"
rm -f mysql_secure_installation.sql
sudo systemctl restart mysql

sudo apt-get install php7.0 php-pear libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php7.0-cgi -y
wget -o /etc/php/7.0/apache2/php.ini  https://raw.githubusercontent.com/maidonghu/ubuntu16.04-LN/master/php.ini

sudo mysql -sfu root < "wordpress.sql"
rm -f wordpress.sql
