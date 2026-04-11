# Kitchen-ansible demo

This repository provides examples demonstrating the use of Kitchen-CI to execute
and test Ansible playbooks. Each branch includes two distinct scenarios: one
focused on the installation of a web server, and another on the deployment of
applications for the KDE desktop environment.

Please follow the install steps below to get started.  After successful installation,
feel free to switch to [webserver](webserver) or [workstation](workstation) and try
it out!!

---
![Static Badge](https://img.shields.io/badge/Tested%20on-Fedora_42-blue)
![Static Badge](https://img.shields.io/badge/Tested%20on-Debian_Stable-blue)
![Static Badge](https://img.shields.io/badge/Tested%20on-Arch_Linux-blue)
![Static Badge](https://img.shields.io/badge/podman-gray?logo=podman)


## Installation

### Basic install

Simply run `make` as a non-root user to install kitchen, pytest, and required plugins.

> [!NOTE]
> Basic install places the kitchen executable outside of the normal user path.  To
> run kitchen use `bundle exec kitchen <command>` or add
> `alias kitchen='bundle exec kitchen'` to your shell's rc file.

> [!NOTE]
> Debian and Archlinux installations do not install kiwi as it is located either in
> Unstable/Sid or the AUR. You must install kiwi manually via your distro package
> manager or via pip.

### Copr install

If you are running a modern Fedora system you may install via copr repo.  All you need
to do is run `make copr` to install the pre-built RPMs.

> [!TIP]
> Installation via Copr repo is highly recommended!

### Verify Kitchen installation

To verify the installation run `make verify`.  This will run `kitchen` and output helpful
information.

### Qemu KVM considerations

The `workstation` branch focuses only on running qemu for virtualization.  For the best
experience, your user account must be added to the `kvm` group on your system.

> [!WARNING]
> The kitchen user MUST be added to the kvm group otherwise the virtual guest runs very
> slowly and inefficiently.

## References

- https://kitchen.ci/docs/getting-started/introduction/
- https://github.com/test-kitchen/kitchen-docker
- https://github.com/neillturner/kitchen-ansible
- https://github.com/esmil/kitchen-qemu/
- https://docs.pytest.org/en/stable/
- https://testinfra.readthedocs.io/en/latest/index.html
- https://osinside.github.io/kiwi/
