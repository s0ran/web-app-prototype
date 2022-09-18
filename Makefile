.PHONY: all help django-mysql gin-base
.DELETE_ON_ERROR: django-mysql	gin-base



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
	PROJECT_DIR=${PROJECT_DIR} PROJECT_NAME=${PROJECT_NAME} BACKEND_NAME=${BACKEND_NAME} . ./src/django-mysql.sh

gin-base:
	PROJECT_DIR=${PROJECT_DIR} PROJECT_NAME=${PROJECT_NAME} BACKEND_NAME=${BACKEND_NAME} . ./src/gin-base.sh


