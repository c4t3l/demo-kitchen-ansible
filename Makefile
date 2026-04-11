# Installation of kitchen components

SHELL = /bin/bash
PYTHONENV = .demo-kitchen-ansible
RUBYENV = ~/.local/share/kitchen-ci/gem

.PHONY: install prereqs ruby python copr verify clean
install: prereqs ruby python

prereqs:
	./prereqs.sh

ruby:
	bundle config set --local path $(RUBYENV)
	bundle install --gemfile=Gemfile

python:
	python3 -m venv $(PYTHONENV)
	$(PYTHONENV)/bin/pip3 install -r requirements.txt

copr:
	sudo dnf -y copr enable rcallicotte/test-kitchen
	sudo dnf -y install rubygem-test-kitchen rubygem-kitchen-docker \
		rubygem-kitchen-qemu rubygem-kitchen-ansible \
		python-pytest-testinfra qemu qemu-img kiwi-cli podman \
		podman-docker tox python-pytest-testinfra+paramiko

verify:
	echo "Verifying installation..."
	kitchen &>/dev/null \
	|| bundle exec kitchen &>/dev/null \
	|| echo "Verfication failed!  Reinstall an try again." \
	echo "Success!!"

clean:
	rm -rfd $(RUBYENV)
	rm -rfd $(PYTHONENV)
