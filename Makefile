SHELL := /bin/bash
include ./srcs/.env

.PHONY: up

up:
	@cd /home/aybiouss/Desktop/Inception/srcs && dotenv docker compose up -d

build:
	docker compose -f srcs/docker-compose.yml build

build-no-cache:
	docker compose -f srcs/docker-compose.yml build --no-cache

down:
	docker compose -f srcs/docker-compose.yml down

rm:
	docker rm -f $$(docker ps -a -q)

rmi:
	docker rmi -f $$(docker images -a -q)

rmv: 
	docker volume rm $$(docker volume ls -q)

rmvd:
	sudo rm -rf /home/aybiouss/data/wordpress/*
	sudo rm -rf /home/aybiouss/data/mariadb/*

rmn:
	docker network prune

rmall:
	docker system prune -f

delete: rm rmi rmv rmvd rmn rmall

re: delete up