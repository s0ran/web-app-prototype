.PHONY: all help django-mysql
.DELETE_ON_ERROR: django-mysql



PROJECT_NAME := djangoapp
PROJECT_DIR := $(shell pwd)
SHELL:= /bin/bash

include .env

BACKEND_NAME:?= $(PROJECT_NAME)_backend

all:
	@echo "Hello $(LOGNAME), nothing to do by default"
	@echo "Try 'make help'"

help:
	@egrep "^# target:" [Mm]akefile

django-mysql:
	git clone -b django/mysql https://github.com/s0ran/web-app-prototype.git ${PROJECT_NAME}; \
	cd ${PROJECT_NAME}; \
	mv backend ${BACKEND_NAME}; \
	cd ${BACKEND_NAME}; \
	pipenv install; \
	pipenv run django-admin startproject ${BACKEND_NAME} .; \
	git remote remove origin; \
	cd ../; \
	sed -e 's/{BACKEND_NAME}/${BACKEND_NAME}/g' example/Dockerfile.development > ${BACKEND_NAME}/Dockerfile.development; \
	sed -e 's/{BACKENDE_NAME}/${BACKEND_NAME}/g' example/docker-compose.development.yml > ./docker-compose.development.yml; \
	sed -e 's/{BACKENDE_NAME}/${BACKEND_NAME}/g' example/settings.py > ${BACKEND_NAME}/${BACKEND_NAME}/settings.py; \
	rm -rf example;


