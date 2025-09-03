FROM redis:7.2.5

COPY redis.conf.template /tmp/redis.conf.template
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ARG PORT
ARG REDIS_PASSWORD
ARG REDIS_MASTER_PASSWORD

ENTRYPOINT ["entrypoint.sh"]
CMD ["redis-server", "/tmp/redis.conf"]
