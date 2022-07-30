FROM alpine:3.14

RUN apk add --no-cache redis && \
    rm -rf /var/cache/apk/* && mkdir /entrypoint && mkdir /conf

# Entrypoint file
ADD ./tools/run.sh /entrypoint/run.sh
ADD ./conf/redis.conf /conf/

# Give perm
RUN chmod 755 -R /entrypoint

ENTRYPOINT [ "/entrypoint/run.sh" ]