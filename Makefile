.PHONY: all help update up shell migrate

all:
	@echo "Hello $(LOGNAME), nothing to do by default"
	@echo "Try 'make help'"

help:
	@egrep "^# target:" [Mm]akefile

build:
	docker-compose -f docker-compose.development.yml build

update:
	docker-compose -f docker-compose.development.yml run --rm backend pipenv install --system

up:
	docker-compose -f docker-compose.development.yml up

shell:
	docker-compose -f docker-compose.development.yml exec backend bash

migrate:
	docker-compose -f docker-compose.development.yml exec backend python3 manage.py migrate