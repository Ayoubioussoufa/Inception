# cd wordpress
# cat /var/www/wordpress/wp-config-sample.php > wp-config.php

# sed -i "s/database_name_here/wordpress/" wp-config.php 
# sed -i "s/username_here/${MYSQL_USER}/" wp-config.php
# sed -i "s/password_here/${MYSQL_PASSWORD}/" wp-config.php
# sed -i "s/localhost/database/" wp-config.php



# wp user create ${MYSQL_USER} ${MYSQL_USER_EMAIL} --role=author --user_pass=${MYSQL_PASSWORD}  --allow-root
# wp user create aybiouss test@gmail.com --role=author --user_pass=aybiouss/1337  --allow-root

# wp core install --url=localhost --title=web-site --admin_user=${MYSQL_DATABASE} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${MYSQL_DATEBASE_EMAIL} --allow-root

# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf


# php-fpm7.3 -F

cd /var/www/html/wordpress

#Downloading and extracting Wordpress core files to the current directory
wp core download --allow-root

# Creating the wp-config.php file using this command.
wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root

# Installing wordpress using the given environment variables to avoid showing the wordpress installation page everytime we run the containe
wp core install --url=${DOMAIN_NAME} --title=DopamInception --admin_user=${WP_USER} --admin_password=${WP_PW} --admin_email=${WP_EMAIL} --a
exec $@