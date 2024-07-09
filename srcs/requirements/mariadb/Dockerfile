FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server

COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh ./script

RUN chmod +x script

ENTRYPOINT ["bash", "./script"]