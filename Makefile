.PHONY: build up up-f-r stop cli

up:
	docker-compose up -d

up-f-r:
	docker-compose up -d --force-recreate

stop:
	docker-compose stop

cli:
	docker-compose exec -u docker php bash

logs:
	docker-compose logs -f