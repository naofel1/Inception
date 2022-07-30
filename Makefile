# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nabentay <nabentay@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/23 08:29:27 by nabentay          #+#    #+#              #
#    Updated: 2022/07/30 21:40:29 by nabentay         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: rvolumes volumes build up

status:
	@docker ps

img:
	@docker images

dns:
	@sudo sed -i "s/localhost/nabentay.42.fr/g" /etc/hosts

logs:
	@docker-compose -f srcs/docker-compose.yml logs

build:
	@docker-compose -f srcs/docker-compose.yml build

down:
	@docker-compose -f srcs/docker-compose.yml down

up: dns
	@docker-compose -f srcs/docker-compose.yml up -d

start:
	@docker-compose -f srcs/docker-compose.yml start

delvolumes:
	@docker volume prune -f

rvolumes:
	@rm -rf  $(HOME)/data

clean: down rvolumes
	@docker volume ls -qf dangling=true | xargs -r docker volume rm

fclean: down rvolumes rm
	@docker volume ls -qf dangling=true | xargs -r docker volume rm

stop:
	docker-compose -f srcs/docker-compose.yml stop

rm:
	@docker system prune -a -f

volumes:
	@mkdir -p ${HOME}/data/db-data
	@mkdir -p ${HOME}/data/www-data
	@mkdir -p ${HOME}/data/backup-data
	@mkdir -p ${HOME}/data/folio-data
	@mkdir -p ${HOME}/data/traefik-data

clean: rm rvolumes

reload: down rvolumes up

#ENV
HOME=/home/nabentay

# Colors
RED = \033[1;31m
GREEN = \033[1;32m
YELLOW = \033[1;33m
BLUE = \033[1;34m
RESET = \033[0m
