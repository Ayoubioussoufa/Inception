iservice mariadb start

sleep 3

mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

echo "database have been created..."

sleep 2

exec mariadbd_safe