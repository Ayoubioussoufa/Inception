service mysql start

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS mariadb; \
                    CREATE USER 'me'@'%' IDENTIFIED BY '12345'; \
                    GRANT ALL PRIVILEGES ON mariadb.* TO 'me'@'%'; \
                    FLUSH PRIVILEGES;"

exec $@