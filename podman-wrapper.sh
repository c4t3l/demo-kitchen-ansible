#!/bin/bash
# vim: set ts=4 sw=4 et:

# Podman/docker socket settings
DOCKER_HOST="unix://run/user/$(id -u)/podman/podman.socket"
export DOCKER_HOST

# If no real subcommand is given (just redirected to /dev/null), exit 0
if [ $# -eq 0 ]; then
    exec podman info > /dev/null 2>&1
fi
exec podman "$@"
