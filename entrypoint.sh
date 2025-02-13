#!/bin/bash

PORT="${PORT:-6379}"

sed -i "s/__PORT__/$PORT/g" /usr/local/etc/redis.conf
sed -i "s/__REQUIREPASS__/$REDIS_PASSWORD/g" /usr/local/etc/redis.conf
sed -i "s/__PRIMARYAUTH__/$REDIS_MASTER_PASSWORD/g" /usr/local/etc/redis.conf

exec "$@"