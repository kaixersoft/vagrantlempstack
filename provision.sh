#!/bin/bash

bash -c 'BASH_ENV=/etc/profile exec bash'

echo "Provisioning virtual machine..."


# Nginx and Git
echo "Installing Nginx......."
apt-get install nginx git -y -q  --fix-missing


# Configure NGINX
sudo rm /etc/nginx/sites-available/default
sudo touch /etc/nginx/sites-available/default

sudo cat >> /etc/nginx/sites-available/default <<'EOF'
server {
  listen   80;

  root /var/www;
  index index.php index.html index.htm;

  # Make site accessible from http://localhost/
  server_name _;

  location / {
    try_files $uri $uri/ /index.php$is_args$args;
  }


  # pass the PHP scripts to FastCGI server listening on /tmp/php5-fpm.sock
  #
  location ~ \.php$ {
    try_files $uri =404;
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass unix:/var/run/php5-fpm.sock;
    fastcgi_index index.php;
    include fastcgi_params;
  }

  # deny access to .htaccess files, if Apache's document root
  # concurs with nginx's one
  #
  location ~ /\.ht {
    deny all;
  }

 
    
}
EOF





# PHP
echo "Updating PHP repository......."
apt-get install python-software-properties build-essential -y -q
add-apt-repository ppa:ondrej/php5 -y -q
apt-get update -y -q

echo "Installing PHP........."
apt-get install php5-common php5-dev php5-cli php5-fpm -y -q

echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y

# MySQL 
echo "Install and configure MySQL .......... "

apt-get install debconf-utils -y -q

debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

apt-get install mysql-server -y -q
sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf

mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"



# Configure php5-fpm
echo "Configure php5-fpm  ............... "
sed -i s/\;cgi\.fix_pathinfo\s*\=\s*1/cgi.fix_pathinfo\=0/ /etc/php5/fpm/php.ini


# Install phpmyadmin and configure
echo "Install and configure PhpMyAdmin"
sudo apt-get install -y phpmyadmin

ln -s /usr/share/phpmyadmin /var/www/phpmyadmin

php5enmod mcrypt


# Restart services
echo "Restart services..."

sudo service php5-fpm restart

sudo service nginx restart

sudo /etc/init.d/mysql restart

clear
