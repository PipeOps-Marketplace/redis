FROM redis:7.2.5

# Install gettext-base, which contains envsubst
RUN apt-get update && apt-get install -y gettext-base

# Change the working directory
WORKDIR /tmp

# Copy the files to the working directory
COPY redis.conf.template /tmp/redis.conf.template
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ARG PORT
ARG REDIS_PASSWORD
ARG REDIS_MASTER_PASSWORD

ENTRYPOINT ["entrypoint.sh"]
CMD ["redis-server", "redis.conf"]
