# FROM debian:buster

# RUN apt update && apt upgrade -y \
#     && apt install php-fpm php-mysql wget unzip curl -y

# WORKDIR /var/www/

# RUN mkdir -p /var/www/wordpress

# RUN mkdir -p /home/aybiouss/data/wordpress

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# RUN wget https://wordpress.org/latest.zip && unzip latest.zip && rm -rf  latest.zip

# RUN mkdir /run/php/ && touch /run/php/php7.3-fpm.pid

# RUN chmod +w /run/php/php7.3-fpm.pid

# COPY tools/script.sh script.sh

# RUN chmod +x script.sh

# CMD ["bash", "script.sh"]


FROM debian:buster
RUN apt-get update && apt-get install -y php7.3 \
    php7.3-fpm php7.3-mysql mariadb-client \
    nginx curl

# Downloading WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Making the wp-cli.phar file executable and moving it to the /usr/local/bin/ path
# and renaming it 'wp' to use that as the command and not 'wp-cli.phar'
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh ./script.sh
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN chmod +x script.sh
RUN mkdir /run/php/

ENTRYPOINT ["sh", "script.sh"]

CMD ["php-fpm7.3", "-R", "-F"]