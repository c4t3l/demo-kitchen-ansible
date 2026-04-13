# Kiwi Descriptions

This is used to build the KDE Desktop image for use in testing playbooks.  This
work is based upon [fedora-kiwi-descriptions](https://pagure.io/fedora-kiwi-descriptions)
and is licensed under GPL-3-or-later.

## Build instructions

Run `make VERSION=<fedora branched version (ie 43)>` to build a branched version
of Fedora KDE.  Omitting the `VERSION` parameter builds Fedora `rawhide` version.

The completed artifact is written to `$HOME/.config/kitchen-qemu`.
