# Installation of kitchen components

.PHONY: install
install:
	inst-ruby
	inst-python

inst-ruby:
	bundle install Gemfile

inst-python:
	pip install -r requirements.txt
