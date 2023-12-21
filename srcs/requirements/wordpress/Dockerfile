# FROM debian:buster
# RUN apt-get update && apt-get install -y php7.3 \
# php7.3-fpm php7.3-mysql mariadb-client \
# nginx curl
# # Downloading WP-CLI
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# # Making the wp-cli.phar file executable and moving it to the /usr/local/bin/ path
# # and renaming it 'wp' to use that as the command and not 'wp-cli.phar'
# RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# COPY ./tools/script.sh /script.sh
# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
# RUN chmod +x script.sh
# RUN mkdir /run/php/
# ENTRYPOINT ["sh", "script.sh"]
# CMD ["php-fpm7.3", "-R", "-F"]

# FROM debian:buster

# RUN apt-get update && apt-get install -y php7.3 \
#     php7.3-fpm php7.3-mysql mariadb-client \
#     nginx curl

# # Downloading WP-CLI
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# # Making the wp-cli.phar file executable and moving it to the /usr/local/bin/ path
# # and renaming it 'wp' to use that as the command and not 'wp-cli.phar'
# RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# # Creating a non-root user
# RUN useradd -m wordpressuser
# USER wordpressuser

# COPY ./tools/script.sh /script.sh
# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# # Fixing directory creation and permissions
# RUN mkdir -p /var/www/html/wordpress && chown -R www-data:www-data /var/www/html/wordpress
# RUN chmod +x script.sh
# RUN mkdir /run/php/

# ENTRYPOINT ["sh", "script.sh"]
# CMD ["php-fpm7.3", "-R", "-F"]

FROM debian:buster

RUN apt-get update && apt-get install -y php7.3 \
    php7.3-fpm php7.3-mysql mariadb-client \
    nginx curl

# Downloading WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Making the wp-cli.phar file executable and moving it to the /usr/local/bin/ path
# and renaming it 'wp' to use that as the command and not 'wp-cli.phar'
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Creating a non-root user
RUN useradd -m wordpressuser
USER wordpressuser

COPY --chown=wordpressuser:www-data ./tools/script.sh /script.sh
COPY --chown=wordpressuser:www-data ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# Creating a volume directory
VOLUME /var/www/html/wordpress

# Fixing permissions during runtime
RUN mkdir /run/php/ && chown -R wordpressuser:www-data /run/php/

ENTRYPOINT ["sh", "/script.sh"]
CMD ["php-fpm7.3", "-R", "-F"]

