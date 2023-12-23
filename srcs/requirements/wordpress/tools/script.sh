cd wordpress
cat /var/www/wordpress/wp-config-sample.php > wp-config.php

sed -i "s/database_name_here/wordpress/" wp-config.php 
sed -i "s/username_here/${MYSQL_USER}/" wp-config.php
sed -i "s/password_here/${MYSQL_PASSWORD}/" wp-config.php
sed -i "s/localhost/database/" wp-config.php



wp user create ${MYSQL_USER} ${MYSQL_USER_EMAIL} --role=author --user_pass=${MYSQL_PASSWORD}  --allow-root
wp user create aybiouss test@gmail.com --role=author --user_pass=aybiouss/1337  --allow-root

wp core install --url=localhost --title=web-site --admin_user=${MYSQL_DATABASE} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${MYSQL_DATEBASE_EMAIL} --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf


php-fpm7.3 -F