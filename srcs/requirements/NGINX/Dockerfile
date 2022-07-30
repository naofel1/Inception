FROM  alpine:3.14

RUN apk add --no-cache nginx openssl gettext && \
    rm -rf /var/cache/apk/*

# Directory for the website
RUN mkdir -p /var/www/html/

# Give perm for nginx user
RUN chown -R nginx:nginx /var/lib/nginx
RUN chown -R nginx:nginx /var/www/html

# Add info about domain
ARG DOMAIN_NAME
ARG NGINX_CERT
ARG NGINX_KEY

# Copy nginx conf template file
COPY ./conf/nginx.conf.template /etc/nginx/template/

# Remplace env with their value
RUN envsubst '${DOMAIN_NAME} ${NGINX_CERT} ${NGINX_KEY}' < \
    /etc/nginx/template/nginx.conf.template > /etc/nginx/nginx.conf

# Generate OpenSSL Certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -sha256 -keyout $NGINX_KEY -out $NGINX_CERT \
    -subj "/C=FR/ST=IDF/L=Paris/O=Inception Nabentay CoMpAnY/OU=CORP/CN=www.nabentay.42.fr"

# Create and copy docker entrypoint
RUN mkdir /entrypoint/
COPY /tools/run.sh /entrypoint/
RUN chmod -R 755 /entrypoint/

ENTRYPOINT [ "/entrypoint/run.sh" ]