# Kitchen-ansible demo

This repository provides examples demonstrating the use of Kitchen-CI to execute 
and test Ansible playbooks. Each branch includes two distinct scenarios: one 
focused on the installation of a web server, and another on the deployment of 
applications for the KDE desktop environment.


## Prerequisites

You must have the following installed:

- ruby >=3.1
- ruby-bundler >=2.5
- python >=3.9 


### Installation

Simply run `make install` to install kitchen, pytest, and required plugins.


## References

- https://kitchen.ci/docs/getting-started/introduction/
- https://kitchen.ci/docs/drivers/dokken/
- https://github.com/neillturner/kitchen-ansible
- https://github.com/esmil/kitchen-qemu/
- https://docs.pytest.org/en/stable/
- https://testinfra.readthedocs.io/en/latest/index.html
- https://osinside.github.io/kiwi/
- https://mkosi.systemd.io/
