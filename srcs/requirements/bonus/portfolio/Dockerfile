FROM alpine:3.14

RUN apk add --no-cache apache2 libxml2-dev apache2-utils && \
    rm -rf /var/cache/apk/* && mkdir /entrypoint && mkdir /conf && \
    chown -R apache.www-data /var/www && \
    mv /etc/apache2/httpd.conf /etc/apache2/httpd.conf.bak

# Entrypoint file
ADD ./tools/run.sh /entrypoint/run.sh
ADD ./conf/httpd.conf /etc/apache2/
# Portfolio website
ADD ./conf/portfolio /var/www

# Give perm
RUN chmod 755 -R /entrypoint

ENTRYPOINT [ "/entrypoint/run.sh" ]