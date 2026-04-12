# Installation of kitchen components

SHELL = /bin/bash
RUBYENV = ~/.local/share/kitchen-ci/gem

.PHONY: install prereqs ruby python copr verify clean
install: prereqs ruby python verify

prereqs:
	./prereqs.sh

ruby:
	bundle config set --local path $(RUBYENV)
	bundle install --gemfile=Gemfile

copr:
	sudo dnf -y copr enable rcallicotte/test-kitchen
	sudo dnf -y install rubygem-test-kitchen rubygem-kitchen-docker \
		rubygem-kitchen-qemu rubygem-kitchen-ansible \
		python-pytest-testinfra qemu-kvm qemu-img kiwi-cli podman \
		podman-docker tox python-pytest-testinfra+paramiko
	$(MAKE) verify

verify:
	./verify.sh

clean:
	rm -rfd $(RUBYENV)
