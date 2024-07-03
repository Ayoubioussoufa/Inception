# #!/bin/bash

# # Wait for the database to be ready
# sleep 10

# cd /var/www/wordpress

# # Check if WordPress is already installed
# if [ -f "wp-config.php" ]; then
#     echo "WordPress is already installed."
# else
#     # Copy the sample config file to wp-config.php
#     cp wp-config-sample.php wp-config.php

#     # Update wp-config.php with environment variables
#     sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" wp-config.php 
#     sed -i "s/username_here/${WORDPRESS_DB_USER}/" wp-config.php
#     sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" wp-config.php
#     sed -i "s/localhost/${WORDPRESS_DB_HOST}/" wp-config.php

#     # Install WordPress core
#     # wp core install --url="http://localhost" --title="web-site" --admin_user="user" --admin_password="password" --admin_email="${MYSQL_DATABASE_EMAIL}" --allow-root
#     # Create a new user
#     wp core install --url=localhost --title=web-site --admin_user='ayoub' --admin_password='1234' --admin_email='ayoub@gmail.com' --allow-root
#     wp user create 'salah' 'sben-ela@gmail.com' --role=author --user_pass='1234'  --allow-root
# fi

# # Update PHP-FPM configuration
# sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

# # Start PHP-FPM
# php-fpm8.2 -F

sleep 10

cd /var/www/wordpress

if [ -f "wp-config.php" ]; then
	echo  "WordPress is already installed."
else
    cat /var/www/wordpress/wp-config-sample.php > wp-config.php

    sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" wp-config.php 
    sed -i "s/username_here/${WORDPRESS_DB_USER}/" wp-config.php
    sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" wp-config.php
    sed -i "s/localhost/${WORDPRESS_DB_HOST}/" wp-config.php
fi

wp core install --url="http://localhost" --title=web-site --admin_user=${ADMIN} --admin_password=${ADMINPASS} --admin_email=${ADMINEMAIL} --allow-root
wp user create ${MYSQL_USER} ${MYSQL_USER_EMAIL} --role=author --user_pass=${MYSQL_PASSWORD}  --allow-root

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf


php-fpm8.2 -F