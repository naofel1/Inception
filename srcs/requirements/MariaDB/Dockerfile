FROM alpine:3.14

# Install of mariadb
RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils && \
    rm -rf /var/cache/apk/*

# Add script and creation of db folder
ADD tools/run.sh /scripts/run.sh
RUN mkdir /db && \
    chmod -R 755 /scripts

# Arg that will be use for credential and information about database
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

# Import of the mariadb config file and the wordpress database
COPY conf/inception-db.sql /db/
COPY conf/my.cnf /etc/mysql/

# Run the script for the creation of the database and user. Then it import the wordpress database
RUN sh /scripts/run.sh & sleep 3 \
        && mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < \
        /db/inception-db.sql && rm -rf /db

ENTRYPOINT ["/scripts/run.sh"]
