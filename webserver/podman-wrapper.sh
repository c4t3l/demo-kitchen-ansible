#!/bin/bash
# vim: set ts=4 sw=4 et:

set +x
# Podman/docker socket settings
DOCKER_HOST="unix://run/user/$(id -u)/podman/podman.sock"
export DOCKER_HOST

# If no real subcommand is given (just redirected to /dev/null), exit 0
if [ $# -eq 0 ]; then
    exec podman info > /dev/null 2>&1
fi

# Check if any argument is "build" — kitchen-docker may prepend
# flags like -H before the subcommand.
is_build=false
for arg in "$@"; do
    if [ "$arg" = "build" ]; then
        is_build=true
        break
    fi
done

# kitchen-docker parses "Successfully built <id>" from build output,
# but podman outputs the image ID on the last line after "COMMIT".
if $is_build; then
    tmpfile=$(mktemp)
    trap 'rm -f "$tmpfile"' EXIT
    podman "$@" > "$tmpfile" 2>&1
    exit_code=$?
    cat "$tmpfile"
    if [ $exit_code -eq 0 ]; then
        image_id=$(tail -1 "$tmpfile")
        echo "Successfully built $image_id"
    fi
    exit $exit_code
else
    exec podman "$@"
fi
