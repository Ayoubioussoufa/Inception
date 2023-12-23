build:
	docker-compose build

build-no-cache:
	docker-compose build --no-cache

up:
	docker-compose up -d

down:
	docker-compose down

rm:
	docker rm -f $$(docker ps -aq)

rmi:
	docker rmi -f $$(docker images -aq)

rmv: 
	docker volume rm $$(docker volume ls -q)

rmvd:
	sudo rm -rf /home/aybiouss/data/wordpress/*
	sudo rm -rf /home/aybiouss/data/mariadb/*