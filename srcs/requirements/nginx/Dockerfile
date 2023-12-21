FROM debian:buster
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nginx
COPY certificate.crt /etc/ssl/
COPY private.key /etc/ssl/
COPY tools/index.html /usr/share/nginx/html
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]