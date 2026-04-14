# Builds Fedora KDE Disk image

SHELL = /bin/bash
WORKDIR = fedora
VERSION = rawhide

.PHONY: prep build convert clean

all: prep build convert clean

prep:
	mkdir -p $$HOME/.config/kitchen-qemu
	sed -e "s/__VERSION__/$(VERSION)/g" $(WORKDIR)/Fedora.kiwi > $(WORKDIR)/.Fedora.kiwi_tmp

build:
	sudo $(WORKDIR)/kiwi-build \
		--kiwi-file=$(WORKDIR)/.Fedora.kiwi_tmp \
		--image-type=oem \
		--image-profile=KDE-Desktop-Disk \
		--output-dir=$(WORKDIR)/output

convert:
	qemu-img convert -p $(WORKDIR)/output-build/Fedora.x86_64-$(VERSION).raw \
		$$HOME/.config/kitchen-qemu/Fedora.x86_64-$(VERSION).qcow2

clean:
	sudo rm -rfd $(WORKDIR)/output-build
	rm -f $(WORKDIR)/.Fedora.kiwi_tmp
	@echo "[ INFO ] Kiwi build complete"
