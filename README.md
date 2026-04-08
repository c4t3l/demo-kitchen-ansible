# Kitchen-ansible demo

This repository provides examples demonstrating the use of Kitchen-CI to execute
and test Ansible playbooks. Each branch includes two distinct scenarios: one
focused on the installation of a web server, and another on the deployment of
applications for the KDE desktop environment.

Please follow the install steps below to get started.  After successful installation,
feel free to switch to one of the other branches to try `Kitchen-CI` out!

---
![Static Badge](https://img.shields.io/badge/Tested%20on-Fedora_42-blue)
![Static Badge](https://img.shields.io/badge/Tested%20on-Debian_Stable-blue)
![Static Badge](https://img.shields.io/badge/Tested%20on-Arch_Linux-blue)
![Static Badge](https://img.shields.io/badge/podman-gray?logo=podman)


## Installation

### Basic install

Simply run `make install` as a non-root user to install kitchen, pytest, and required plugins.

### Copr install

If you are running a modern Fedora system you may install via copr repo.
```bash
dnf copr enable rcallicotte/test-kitchen
dnf install test-kitchen kitchen-docker kitchen-qemu kitchen-ansible python-pytest-testinfra \
    qemu qemu-img kiwi-cli
```

> [!NOTE]
> Installation via Copr repo is highly recommended!

## References

- https://kitchen.ci/docs/getting-started/introduction/
- https://kitchen.ci/docs/drivers/dokken/
- https://github.com/neillturner/kitchen-ansible
- https://github.com/esmil/kitchen-qemu/
- https://docs.pytest.org/en/stable/
- https://testinfra.readthedocs.io/en/latest/index.html
- https://osinside.github.io/kiwi/
