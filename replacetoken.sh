#!/bin/bash
 
. /usr/local/osmosix/etc/userenv
. /usr/local/osmosix/service/utils/cfgutil.sh
conf_file1=/var/www/wp-config.php

replaceToken $conf_file1 "%WP_DB_USER%" $WP_DB_USER
replaceToken $conf_file1 "%WP_DB_PASSWORD%" $WP_DB_PASSWORD