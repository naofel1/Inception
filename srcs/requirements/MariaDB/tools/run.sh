#!/bin/sh

if [ -d "/run/mysqld" ]; then
	echo "[i] mysqld (SKip..)"
	chown -R mysql:mysql /run/mysqld
else
	echo "[i] mysqld (Creating..)"
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d /var/lib/mysql/mysql ]; then
	echo "[i] MySQL data directory (skip)"
	chown -R mysql:mysql /var/lib/mysql
else
	echo "[i] MySQL data directory (Creating..)"

	mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null

	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
	    return 1
	fi

	cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
DROP DATABASE IF EXISTS test ;
FLUSH PRIVILEGES ;
EOF

	if [ "$MYSQL_DATABASE" != "" ]; then
	    echo "[i] Creating database: $MYSQL_DATABASE"
		echo "[i] with character set: 'utf8' and collation: 'utf8_general_ci'"
		echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tfile

	 if [ "$MYSQL_USER" != "" ]; then
		echo "[i] Creating user: $MYSQL_USER with password $MYSQL_PASSWORD"
		echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $tfile
	    fi
	fi

	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < $tfile
	rm -f $tfile

	echo 'MySQL init process done (Ready..)'

	echo "exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0" "$@"
fi
echo " (                                          (          "
echo " )\ )                       )               )\ )   (   "
echo "(()/(            (       ( /((             (()/( ( )\  "
echo " /(_))(     (   ))\`  )  )\())\  (   (      /(_)))((_) "
echo "(_))  )\ )  )\ /((_)(/( (_))((_) )\  )\ )  (_))_((_)_  "
echo "|_ _|_(_/( ((_|_))((_)_\| |_ (_)((_)_(_/(   |   \| _ ) "
echo " | || ' \)) _|/ -_) '_ \)  _|| / _ \ ' \))  | |) | _ \ "
echo "|___|_||_|\__|\___| .__/ \__||_\___/_||_|   |___/|___/ "
echo "                  |_|                                  "

exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@
