# Use the Redis Bitnami image as the base image
FROM bitnami/redis:6

# Set default values for environment variables using ARG
ARG PORT=6379
ARG REDIS_PASSWORD
ARG REDIS_MASTER_PASSWORD
ARG REDIS_ALLOW_REMOTE_CONNECTIONS
ARG ALLOW_EMPTY_PASSWORD

# Set environment variables using ENV
ENV PORT=${PORT}
ENV REDIS_PASSWORD=${REDIS_PASSWORD}
ENV REDIS_MASTER_PASSWORD=${REDIS_MASTER_PASSWORD}
ENV REDIS_ALLOW_REMOTE_CONNECTIONS=${REDIS_ALLOW_REMOTE_CONNECTIONS}
ENV ALLOW_EMPTY_PASSWORD=${ALLOW_EMPTY_PASSWORD}

# Copy the custom Redis configuration file into the image
COPY redis.conf /usr/local/etc/redis/redis.conf

ENV REDIS_OVERRIDES_FILE=/usr/local/etc/redis/redis.conf

# Expose the default Redis port
EXPOSE ${PORT}

# Start the Redis server with the custom configuration file
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
