FROM debian:buster

RUN apt update && apt upgrade -y \
    && apt install php-fpm php-mysql wget unzip curl -y

WORKDIR /var/www/

RUN mkdir -p /var/www/wordpress

RUN mkdir -p /home/aybiouss/data/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN wget https://wordpress.org/latest.zip && unzip latest.zip && rm -rf  latest.zip

RUN mkdir /run/php/ && touch /run/php/php7.3-fpm.pid

RUN chmod +w /run/php/php7.3-fpm.pid

COPY tools/script.sh script.sh

RUN chmod +x script.sh

CMD ["bash", "script.sh"]