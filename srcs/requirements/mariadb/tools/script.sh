service mysql start

sleep 2

mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root -e  "CREATE USER IF NOT EXISTS '${DBUser}'@'%' IDENTIFIED BY '${DBUserPassword}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO '${DBUser}'@'%';FLUSH PRIVILEGES;"


mysqladmin -u root shutdown

echo "database have been created..."

mysqld_safe


# https://youtu.be/xiUTqnI6xk8?si=Jw3DDYc0JuNJbTGE

# service mysql start

# sleep 1

# mariadb -u root -e "CREATE DATABASE '${DBName}' ; CREATE USER '${DBUser}'@'%' IDENTIFIED BY '${DBUserPassword}'; REQUIRE NOT REGEXP 'admin|Admin|administrator|Administrator'; GRANT ALL PRIVILEGES ON '${DBName}'.* TO '${DBUser}'@'%'; FLUSH PRIVILEGES; ALTER USER 'root'@'localhost' IDENTIFIED BY '${DBRootPassword}'; FLUSH PRIVILEGES;"

# exec $@