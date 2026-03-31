# Installation of kitchen components

SHELL = /bin/bash
PYTHONENV = .demo-kitchen-ansible
RUBYENV = ~/.local/share/kitchen-ci/gem

.PHONY: install
install: inst-prereqs inst-ruby inst-python

inst-prereqs:
	./prereqs.sh

inst-ruby:
	bundle config set --local path $(RUBYENV)
	bundle install --gemfile=Gemfile

inst-python:
	python3 -m venv $(PYTHONENV)
	$(PYTHONENV)/bin/pip3 install -r requirements.txt

clean:
	rm -rfd $(RUBYENV)
	rm -rfd $(PYTHONENV)
