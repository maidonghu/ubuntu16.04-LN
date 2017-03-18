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

