#!/bin/bash

set -euxo pipefail

#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]-[$kiwi_profiles]..."

#======================================
# Set SELinux booleans
#--------------------------------------
# Fixes KDE Plasma, see rhbz#2058657
setsebool -P selinuxuser_execmod 1

#======================================
# Clear machine specific configuration
#--------------------------------------
## Clear machine-id on pre generated images
rm -f /etc/machine-id
echo 'uninitialized' > /etc/machine-id
## remove random seed, the newly installed instance should make its own
rm -f /var/lib/systemd/random-seed

#======================================
# Configure grub correctly
#--------------------------------------
# Works around issues with grub-bls
# See: https://github.com/OSInside/kiwi/issues/2198
echo "GRUB_DEFAULT=saved" >> /etc/default/grub
# Disable submenus to match Fedora
echo "GRUB_DISABLE_SUBMENU=true" >> /etc/default/grub
# Disable recovery entries to match Fedora
echo "GRUB_DISABLE_RECOVERY=true" >> /etc/default/grub
# Write `menu_auto_hide=1` into grubenv to match Fedora anaconda installs
# Set boot_success to avoid displaying the grub menu on first boot
grub2-editenv /boot/grub2/grubenv set menu_auto_hide=1 boot_success=1

#======================================
# Resize root partition on first boot
#--------------------------------------

if [[ "$kiwi_profiles" == *"Disk"* ]]; then
	mkdir -p /etc/repart.d/
	cat > /etc/repart.d/50-root.conf << EOF
[Partition]
Type=root
EOF
fi

#======================================
# Delete & lock the root user password
#--------------------------------------
passwd -d root
passwd -l root

#======================================
# Setup default services
#--------------------------------------

# SKIPPING

#======================================
# Setup firstboot initial setup
#--------------------------------------

# SKIPPING

#======================================
# Setup default target
#--------------------------------------
if [[ "$kiwi_profiles" == *"Desktop"* ]]; then
	systemctl set-default graphical.target
else
	systemctl set-default multi-user.target
fi

#======================================
# Setup default customizations
#--------------------------------------

# SKIPPING

#======================================
# Finalization steps
#--------------------------------------
# Inhibit the ldconfig cache generation unit, see rhbz2348669
touch -r "/usr" "/etc/.updated" "/var/.updated"

#======================================
# Activate services for kitchen
#--------------------------------------
for service in sshd chronyd dbus-broker NetworkManager; do
    systemctl enable ${service}
done

#======================================
# Sudo rules
#--------------------------------------
echo "kitchen    ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/00-kitchen

#======================================
# Revert crypto policy
#--------------------------------------
update-crypto-policies --set LEGACY

exit 0
