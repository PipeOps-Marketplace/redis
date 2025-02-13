# Use Bitnami Redis 6.0 as the base image for linux/arm64
FROM bitnami/redis:6.0

# Non-sensitive build argument for port
ARG PORT

# Sensitive data as build arguments.
# Warning: For production environments, do not bake sensitive data into your image.
ARG REDIS_PASSWORD
ARG REDIS_MASTER_PASSWORD
ARG REDIS_ALLOW_REMOTE_CONNECTIONS
ARG ALLOW_EMPTY_PASSWORD

# Set environment variables for non-sensitive configuration.
# Note: We deliberately do not pass sensitive values via ENV.
ENV REDIS_PORT=${PORT} \
    REDIS_OVERRIDES_FILE=/opt/bitnami/redis/etc/redis.conf \
    REDIS_PASSWORD=${REDIS_PASSWORD} \
    REDIS_MASTER_PASSWORD=${REDIS_MASTER_PASSWORD} \
    REDIS_ALLOW_REMOTE_CONNECTIONS=${REDIS_ALLOW_REMOTE_CONNECTIONS} \
    ALLOW_EMPTY_PASSWORD=${ALLOW_EMPTY_PASSWORD} \
    REDIS_OVERRIDES_FILE=/opt/bitnami/redis/etc/redis.conf

# Copy the custom Redis configuration file into the expected directory.
COPY redis.conf /opt/bitnami/redis/etc/redis.conf

# Adjust file permissions so that the non-root Bitnami user can read the configuration file.
USER root
RUN chown 1001:1001 /opt/bitnami/redis/etc/redis.conf && \
    chmod 644 /opt/bitnami/redis/etc/redis.conf

# Switch back to the non-root Bitnami user.
USER 1001

# Expose the configured Redis port.
EXPOSE ${PORT}

# Explicitly use Bitnami's entrypoint and run scripts so Redis stays running in the foreground
CMD ["/opt/bitnami/scripts/redis/entrypoint.sh", "/opt/bitnami/scripts/redis/run.sh"]