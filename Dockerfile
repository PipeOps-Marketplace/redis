FROM redis:7.2.5

COPY redis.conf /tmp/redis.conf
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ARG PORT
ARG REDIS_PASSWORD
ARG REDIS_MASTER_PASSWORD

ENTRYPOINT ["entrypoint.sh"]
CMD ["redis-server", "/tmp/redis.conf"]
