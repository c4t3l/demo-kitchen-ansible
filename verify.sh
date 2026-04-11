#!/bin/bash
# Verify kitchen installation
# vim: set ts=4 sw=4 et:

echo "[ INFO ] Verifying Kitchen installation..."
if command -v kitchen >/dev/null; then
    echo "[ INFO ] Found $(command -v kitchen)!"
    echo "[ INFO ] Installation is successful!"
elif  bundle exec kitchen >/dev/null; then
    echo "[ INFO ] Found $(command -v bundle) exec kitchen!"
    echo "[ INFO ] Installation is successful!"
else
    echo "[ ERROR ] Could not find kitchen or bundle executable!"
    echo "[ ERROR ] Installation failed! Recheck environment? Run 'make clean', try again"
    exit 1
fi

exit 0
