FROM alpine:3.14

# Install of vsftpd (FTP Server)
RUN apk add --no-cache vsftpd openssl && \
    rm -rf /var/cache/apk/* && \
    mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak && \
    mkdir entrypoint

# Import args from docker-compose
ARG FTP_USER
ARG FTP_PASSWORD

# Import vsftpd config file
ADD ./conf/vsftpd.conf /etc/vsftpd/
ADD ./tools/run.sh /entrypoint/

# Configure FTP user
RUN addgroup -g 10001 -S $FTP_USER && \
    mkdir -p /var/www/html/wordpress/ && \
    adduser -u 10000 -D -G $FTP_USER -h /var/www/html/wordpress/ -s /bin/false $FTP_USER && \
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd $FTP_PASSWORD && \
    chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress/

# Give perm
RUN chmod 755 -R /entrypoint 

ENTRYPOINT [ "/entrypoint/run.sh" ]

