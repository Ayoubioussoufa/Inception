#!/bin/bash

service mariadb start

sleep 3

mariadb  -e "CREATE DATABASE IF NOT EXISTS $DBName;"
mariadb -e "CREATE USER IF NOT EXISTS '$DBUser'@'%' IDENTIFIED BY '$DBUserPassword';"
mariadb -e "GRANT ALL PRIVILEGES ON \`$DBName\`.* TO '$DBUser'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

echo "database have been created..."

sleep 2

mysqld_safe

# https://youtu.be/xiUTqnI6xk8?si=Jw3DDYc0JuNJbTGE
