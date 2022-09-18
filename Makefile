.PHONY: all help up upd ps down update shell migrate makemigrations createsuperuser showmigrations django-shell mysql

include .env.development

app:=djangoapp

all:
	@echo "Hello $(LOGNAME), nothing to do by default"
	@echo "Try 'make help'"

help:
	@egrep "^# target:" [Mm]akefile

# general
build:
	docker-compose -f docker-compose.development.yml build

debug-build:
	docker-compose -f docker-compose.development.yml build --no-cache --progress=plain

up:
	docker-compose -f docker-compose.development.yml up

upd:
	docker-compose -f docker-compose.development.yml up -d

down:
	docker-compose -f docker-compose.development.yml down

ps:
	docker-compose -f docker-compose.development.yml ps

# django
update:
	docker-compose -f docker-compose.development.yml exec backend pipenv install --system

shell:
	docker-compose -f docker-compose.development.yml exec backend bash

startapp:
	docker-compose -f docker-compose.development.yml exec backend python manage.py startapp $(app)

migrate:
	docker-compose -f docker-compose.development.yml exec backend python3 manage.py migrate

makemigrations:
	docker-compose -f docker-compose.development.yml exec backend python3 manage.py makemigrations

createsuperuser:
	docker-compose -f docker-compose.development.yml exec backend python3 manage.py createsuperuser

showmigrations:
	docker-compose -f docker-compose.development.yml exec backend python3 manage.py showmigrations

django-shll:
	docker-compose -f docker-compose.development.yml exec backend python3 manage.py shell

# mysql
mysql:
	docker-compose -f docker-compose.development.yml exec db mysql -u$(MYSQL_USER) -p${MYSQL_PASSWORD} $(MYSQL_DATABASE)


