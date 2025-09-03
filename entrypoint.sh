#!/bin/bash

PORT="${PORT:-6379}"

# Perform the sed operations on the file in /tmp
sed -i "s/__PORT__/$PORT/g" /tmp/redis.conf
sed -i "s/__REQUIREPASS__/$REDIS_PASSWORD/g" /tmp/redis.conf
sed -i "s/__PRIMARYAUTH__/$REDIS_MASTER_PASSWORD/g" /tmp/redis.conf

exec "$@"
