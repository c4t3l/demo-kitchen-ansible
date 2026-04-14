# Builds Fedora KDE Disk image

SHELL = /bin/bash
WORKDIR = fedora
VERSION = rawhide

.PHONY: help prep build install clean

help:
	@awk 'BEGIN { \
	    FS = ":.*##"; \
	    printf "\nUsage:\n  make \033[36m<VERSION=NN (default=rawhide)>    <target>\033[0m\n"; \
	} \
	    /^[a-zA-Z_0-9-]+:.*?##/ { \
	    printf "  \033[36m%-26s\033[0m %s\n", $$1, $$2; \
	} \
	    /^##@/ { \
	        printf "\n\033[1m%s\033[0m\n", substr($$0, 5); \
	}' $(MAKEFILE_LIST)

all: prep build install clean

prep: ## Prepares install dest and templates
	mkdir -p $$HOME/.config/kitchen-qemu
	sed -e "s/__VERSION__/$(VERSION)/g" $(WORKDIR)/Fedora.kiwi > $(WORKDIR)/.Fedora.kiwi_tmp

build: ## builds the defined image
	sudo $(WORKDIR)/kiwi-build \
		--kiwi-file=$(WORKDIR)/.Fedora.kiwi_tmp \
		--image-type=oem \
		--image-profile=KDE-Desktop-Disk \
		--output-dir=$(WORKDIR)/output

install: ## converts and installs image
	qemu-img convert -p $(WORKDIR)/output-build/Fedora.x86_64-$(VERSION).raw \
		$$HOME/.config/kitchen-qemu/Fedora.x86_64-$(VERSION).qcow2

clean: ## removes workdir and tempfiles
	sudo rm -rfd $(WORKDIR)/output-build
	rm -f $(WORKDIR)/.Fedora.kiwi_tmp
	@echo "[ INFO ] Kiwi build complete"
