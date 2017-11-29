FROM redis:4.0.2-alpine

LABEL maintainer "Adrian Riobo Lorenzo <adrian.riobo.lorenzo@gmail.com>"

COPY docker-entrypoint.sh /usr/local/bin

ADD redis.conf /usr/local/etc/redis/redis.conf

RUN apk add --update net-tools \
    && find /usr/local/bin -name "*.sh" -exec chmod +x {} \; 

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]



