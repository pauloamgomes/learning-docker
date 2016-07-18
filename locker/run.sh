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

echo " Done! Starting apache..."
exec /usr/sbin/apachectl -D FOREGROUND


