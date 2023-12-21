FROM debian:buster
RUN apt-get update && apt-get install -y mariadb-server
COPY ./tools/script.sh script
COPY ./conf/server.conf /etc/mysql/mariadb.conf.d/
RUN chmod +x script
RUN ./script
CMD ["mysqld"]