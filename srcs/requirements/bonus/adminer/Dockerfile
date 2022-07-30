FROM  alpine:3.14

RUN apk add --no-cache curl openssl php7 \
    php7-mongodb php7-pdo_dblib php7-pdo_mysql \
    php7-pdo_odbc php7-pdo_pgsql php7-pdo_sqlite \
    php7-session php7-simplexml php7-sqlite3 && \
    rm -rf /var/cache/apk/*

# Directory for adminer page
RUN mkdir -p /adminer
WORKDIR /adminer

# Set upload size
RUN sed -i 's/upload_max_filesize.*=.*/upload_max_filesize = 100M/g' /etc/php7/php.ini && \
    sed -i 's/post_max_size.*=.*/post_max_size = 100M/g' /etc/php7/php.ini

# Copy adminer page
COPY ./conf/adminer.php /adminer/

# Setup adminer user
RUN addgroup adminer && \
    adduser -s /sbin/halt -h /adminer -D -G adminer adminer && \
    chown -R adminer:adminer /adminer

# Create and copy docker entrypoint
RUN mkdir /entrypoint/
COPY /tools/run.sh /entrypoint/
RUN chmod -R 755 /entrypoint/

USER    adminer
ENTRYPOINT [ "/entrypoint/run.sh" ]