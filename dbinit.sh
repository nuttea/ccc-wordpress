#!/bin/bash

. /usr/local/osmosix/etc/.osmosix.sh
source /usr/local/osmosix/etc/userenv
. /usr/local/osmosix/service/utils/cfgutil.sh

#chmod 777 /tmp
cd /tmp

wget https://raw.githubusercontent.com/nuttea/ccc-wordpress/master/wordpress.sql.tmpl
BASE_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
sudo mv $BASE_DIR/wordpress.sql.tmpl .

cp wordpress.sql.tmpl wordpress.sql

chmod 777 /tmp/wordpress.sql
replaceToken  wordpress.sql "%WP_DB_USER%" $WP_DB_USER
replaceToken  wordpress.sql "%WP_DB_PASSWORD%" $WP_DB_PASSWORD

#remove sudo all permissions
source /usr/local/osmosix/etc/.osmosix.sh
localUser=`echo $OSMOSIX_SYSTEM_DATA | cut -d: -f2 | cut -d, -f1 | cut -d\" -f2`
echo $localUser
 
chmod 0640 /etc/sudoers
sudo sed -i "s, $localUser  ALL= NOPASSWD: ALL,# $localUser  ALL= NOPASSWD: ALL,g" /etc/sudoers

