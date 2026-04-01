# Kitchen-ansible demo

This repository provides examples demonstrating the use of Kitchen-CI to execute 
and test Ansible playbooks. Each branch includes two distinct scenarios: one 
focused on the installation of a web server, and another on the deployment of 
applications for the KDE desktop environment.

---
![Static Badge](https://img.shields.io/badge/Tested%20on-Fedora_42-blue)
![Static Badge](https://img.shields.io/badge/Tested%20on-Debian_Stable-blue)
![Static Badge](https://img.shields.io/badge/Tested%20on-Arch_Linux-blue)
![Static Badge](https://img.shields.io/badge/podman-gray?logo=podman)


## Installation

Simply run `make install` as a non-root user to install kitchen, pytest, and required plugins.

## References

- https://kitchen.ci/docs/getting-started/introduction/
- https://kitchen.ci/docs/drivers/dokken/
- https://github.com/neillturner/kitchen-ansible
- https://github.com/esmil/kitchen-qemu/
- https://docs.pytest.org/en/stable/
- https://testinfra.readthedocs.io/en/latest/index.html
- https://osinside.github.io/kiwi/
- https://mkosi.systemd.io/
