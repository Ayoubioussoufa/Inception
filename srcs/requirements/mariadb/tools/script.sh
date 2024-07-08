service mariadb start

sleep 3

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"

service mariadb stop

echo "database have been created..."

sleep 2

# `exec` to replace the current shell process with `mysqld_safe` command that is a script provided by MySQL to manage the startup of the MYSQL server
exec mysqld_safe