# Use the Redis Alpine image as the base image
FROM redis:6-alpine

# Copy the custom Redis configuration file into the image
COPY redis.conf /usr/local/etc/redis/redis.conf

# Expose the default Redis port
EXPOSE 6379

# Start the Redis server with the custom configuration file
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
