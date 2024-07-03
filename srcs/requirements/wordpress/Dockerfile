FROM debian:buster

RUN apt update && apt upgrade -y \
    && apt install php-fpm php-mysql wget unzip curl -y

WORKDIR /var/www/

RUN mkdir -p /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN wget https://wordpress.org/latest.zip && unzip latest.zip && rm -rf  latest.zip

COPY ./tools/script.sh ./script.sh

RUN chmod +x script.sh

ENTRYPOINT ["sh", "script.sh"]

CMD ["php-fpm7.3", "-R", "-F"]