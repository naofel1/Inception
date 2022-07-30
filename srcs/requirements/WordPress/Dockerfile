FROM alpine:3.14

RUN apk add --no-cache php7-fpm php7-json php7-zlib php7-xml php7-xmlwriter php7-simplexml php7-pdo php7-phar php7-openssl \
    php7-pdo_mysql php7-mysqli php7-session \
    php7-gd php7-iconv php7-mcrypt php7-gmp php7-zip \
    php7-curl php7-opcache php7-ctype php7-apcu \
    php7-intl php7-bcmath php7-dom php7-pecl-redis php7-mbstring php7-xmlreader mariadb-client gettext && \
    rm -rf /var/cache/apk/*

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN rm latest.tar.gz

# Create and copy docker entrypoint
RUN mkdir /entrypoint/
COPY /tools/run.sh /entrypoint/
RUN chmod -R 755 /entrypoint/

# Copy config files
COPY conf/wp-config.php /wordpress/wp-config.php.tmp
COPY conf/www.conf /etc/php7/php-fpm.d

ARG WP_DB
ARG WP_USER
ARG WP_PASSWORD
ARG WP_HOST

# Remplace env with their value
RUN envsubst '${WP_DB} ${WP_USER} ${WP_PASSWORD} ${WP_HOST}' < \
    /wordpress/wp-config.php.tmp > /wordpress/wp-config.php && rm /wordpress/wp-config.php.tmp

# Move wordpress file
RUN mkdir -p /var/www/html/wordpress && cp -r /wordpress/* /var/www/html/wordpress/ && \
    chmod -R 777 /var/www/html/wordpress/wp-content/

# Configure Redis
COPY /conf/object-cache.php /var/www/html/wordpress/wp-content/

ENTRYPOINT [ "/entrypoint/run.sh" ]