FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY ./tools/script.sh script

RUN mkdir -p /var/lib/mysql

#
RUN mkdir -p /home/aybiouss/data/mariadb
# 

COPY ./conf/server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x script

RUN ./script

CMD ["mysqld"]