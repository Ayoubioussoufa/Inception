#!/bin/bash

mkdir -p /var/www/wordpress
cd /var/www/wordpress

until mariadb -u "$MYSQL_USER" -h mariadb --password="${MYSQL_PASSWORD}" -e "show databases;"; do
  echo "Database is not up yet. Waiting..."
  sleep 0.2 
done

sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf


wp core download  --allow-root

wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb 

wp core install --url="http://localhost" --title=DopamInception --admin_user=${ADMIN} --admin_password=${ADMINPASS} --admin_email=${ADMINEMAIL} --allow-root

wp user create ${MYSQL_USER} ${MYSQL_USER_EMAIL} --role=author --user_pass=${MYSQL_PASSWORD} --allow-root

chown -R www-data:www-data /var/www/wordpress

mkdir -p /run/php/

# echo $MYSQL_DATABASE $MYSQL_USER $MYSQL_USER_EMAIL $MYSQL_PASSWORD

exec php-fpm7.4 -F -R