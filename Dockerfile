FROM redis:7.2.5

COPY redis.conf /usr/local/etc/redis.conf

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Change ownership of the directory and its contents
RUN chown -R redis:redis /usr/local/etc

WORKDIR /usr/local/etc

ARG PORT
ARG REDIS_PASSWORD
ARG REDIS_MASTER_PASSWORD

ENTRYPOINT ["entrypoint.sh"]
CMD ["redis-server", "/usr/local/etc/redis.conf"]
