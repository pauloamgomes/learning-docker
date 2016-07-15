#!/bin/bash
# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container. httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/*

# need to create directories per /usr/lib/tmpfiles.d/httpd.conf
mkdir -p /run/httpd/htcacheclean
chmod 710 /run/httpd
chmod 700 /run/httpd/htcacheclean

chown root:apache /run/httpd
chown apache:apache /run/httpd/htcacheclean

# Should run only in first execution, deploy learning locker to web folder
if [ ! -d "/var/www/learninglocker" ]; then
  echo " Deploying learninglocker code into /var/www/learninglocker ..."
  mv /learninglocker /var/www/
fi

echo " Done! Starting apache..."
exec /usr/sbin/apachectl -D FOREGROUND


