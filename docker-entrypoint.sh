#!/bin/bash
set -e

# Check if the first argument is not 'asadmin' or 'startserv'
if [ "$1" != 'asadmin' -a "$1" != 'startserv' ]; then
    exec "$@"
fi

# Placeholder file to check if the container has already started
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -f "$CONTAINER_ALREADY_STARTED" ]; then
    touch "$CONTAINER_ALREADY_STARTED"
    # Remove any existing autodeploy status files
    rm -rf glassfish/domains/domain1/autodeploy/.autodeploystatus || true
fi

# If the first argument is 'startserv', execute the command and exit
if [ "$1" == 'startserv' ]; then
    exec "$@"
fi

# Function to handle exit and stop the GlassFish domain
on_exit () {
    EXIT_CODE=$?
    set +e
    ps -lAf
    asadmin stop-domain --force --kill
    exit $EXIT_CODE
}
trap on_exit EXIT

# Print environment variables and execute the provided command
env | sort
"$@" & wait


