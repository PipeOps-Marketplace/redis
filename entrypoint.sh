#!/bin/bash

# Export ARG variables as environment variables for runtime
export PORT=${PORT:-6379}
export REDIS_PASSWORD
export REDIS_MASTER_PASSWORD

# Use envsubst to replace variables from the template and save to a new file
envsubst < redis.conf.template > /tmp/redis.conf

# Execute the main command
exec "$@"
