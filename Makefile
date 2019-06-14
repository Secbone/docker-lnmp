.PHONY: init clean

PHP_CONTAINER = lnmp_php_fpm

COMPOSE = docker-compose -f compose.yml


init:
	docker build --build-arg plugins=git,cors,realip,expires,cache,cloudflare,godaddy,googlecloud,linode github.com/abiosoft/caddy-docker.git -t caddy

	sudo chown -R 999:999 socks mariadb/data

	$(COMPOSE) up -d

	docker exec $(PHP_CONTAINER) docker-php-ext-install mysqli pdo_mysql
	docker exec $(PHP_CONTAINER) docker-php-ext-enable mysqli pdo_mysql
	docker restart $(PHP_CONTAINER)

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

clean:
	$(COMPOSE) down
