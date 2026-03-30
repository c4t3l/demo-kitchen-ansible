# Installation of kitchen components

SHELL = /bin/bash

.PHONY: install
install: inst-prereqs inst-ruby inst-python

inst-prereqs:
	./prereqs.sh

inst-ruby:
	bundle install --gemfile=Gemfile

inst-python:
	pip install -r requirements.txt
