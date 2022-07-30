FROM alpine:3.14

RUN mkdir /tools && mkdir /entrypoint/

# Import Traefik binary
COPY ./tools/traefik /tools/
COPY /tools/run.sh /entrypoint/
COPY ./conf/traefik.toml /tools/

RUN chmod 755 -R /tools && chmod -R 755 /entrypoint/

ENTRYPOINT [ "/entrypoint/run.sh" ]