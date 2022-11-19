#!/bin/sh

cp /tmp/*.cnf /etc/mysql/my.cnf
chmod 644 /etc/mysql/my.cnf
/usr/local/bin/docker-entrypoint.sh mysqld
#  --user=root
# --initialize
# --skip-grant-tables