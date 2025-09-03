#!/bin/bash

# Ensure environment variables are set and exported
export PORT=${PORT:-6379}
export REDIS_PASSWORD="${REDIS_PASSWORD}"
export REDIS_MASTER_PASSWORD="${REDIS_MASTER_PASSWORD}"

# Use envsubst to process the template
envsubst < /tmp/redis.conf.template > /tmp/redis.conf

# Check if the generated config file exists
if [ ! -f "/tmp/redis.conf" ]; then
    echo "Error: Final configuration file was not created." >&2
    exit 1
fi

exec "$@"
