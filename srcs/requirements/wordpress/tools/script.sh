#!/bin/bash

mkdir -p /var/www/wordpress
cd /var/www/wordpress

until mariadb -u "$MYSQL_USER" -h mariadb --password="${MYSQL_PASSWORD}" -e "show databases;"; do
  echo "Database is not up yet. Waiting..."
  sleep 0.2 
done

# Use `sed` to edit a configuration file (`www.conf`) for PHP-FPM
# Replace the line containing 'listen = /run/php/php7.4-fpm.sock' with 'listen = 0.0.0.0:9000'
# Specify the path to the configuration file
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf

# Download WordPress core files
wp core download  --allow-root

# Generate wp-config.php file with database configuration
wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb 

# Install WordPress with initial settings
wp core install --url="http://localhost" --title=DopamInception --admin_user=${ADMIN} --admin_password=${ADMINPASS} --admin_email=${ADMINEMAIL} --allow-root

# Create a new WordPress user with 'author' role
wp user create ${MYSQL_USER} ${MYSQL_USER_EMAIL} --role=author --user_pass=${MYSQL_PASSWORD} --allow-root

# Change ownership of WordPress directory to www-data
chown -R www-data:www-data /var/www/wordpress

# Create a directory for PHP
mkdir -p /run/php/

# `exec` to replace the current shell process with `php-fpm7.4` command
# Run PHP-FPM in the foreground
exec php-fpm7.4 -F -R