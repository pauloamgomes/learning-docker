# Learning Locker (http://learninglocker.net/) LRS container
# Based on work from https://github.com/LearningLocker/docs/issues/15
# Version 1

# Pull and use the centos7 image as the base
FROM centos:centos7
USER root

MAINTAINER Paulo Gomes

#VOLUME /var/www

# Update image
RUN yum update -y

# Install Remi Collet Repository
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-7.noarch.rpm && rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# Install apache, php
RUN yum -y --enablerepo=remi,remi-php56 install httpd php php-pdo php-common php-cli php-pear php-mysqlnd php-pecl-mongo php-gd php-mbstring* php-mcrypt php-xml mongodb nodejs npm git deltarpm

# Install Bower
RUN npm install -g bower

# Install Composer and set global launch
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# need to create directories per /usr/lib/tmpfiles.d/httpd.conf
RUN rm -rf /run/httpd/*; mkdir -p /run/httpd/htcacheclean; chmod 710 /run/httpd; chmod 700 /run/httpd/htcacheclean; chown root:apache /run/httpd; chown apache:apache /run/httpd/htcacheclean

# clone learninglocker via git
RUN git clone https://github.com/LearningLocker/learninglocker.git /learninglocker

# install learninglocker
RUN cd /learninglocker; composer install

# modify apache settings
ADD /conf/vhost.conf /etc/httpd/conf.d/vhost.conf
RUN sed -i "s/^DocumentRoot.*//g" /etc/httpd/conf/httpd.conf

# add local configurations
ADD ./conf/app.php /learninglocker/app/config/local/app.php
ADD ./conf/database.php /learninglocker/app/config/local/database.php
ADD ./conf/mail.php /learninglocker/app/config/local/mail.php

RUN chown -R apache:apache /learninglocker
RUN cd  /var/www; ln -s /learninglocker

# create our container startup script
ADD run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

# define entrypoint so ll will start from docker run
ENTRYPOINT ["/usr/bin/run.sh"]
