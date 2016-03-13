# PHP 7 Apache
# Suitable for akrabat's Slim 3 Skeleton
# https://github.com/akrabat/slim3-skeleton

FROM php:7.0-apache

MAINTAINER Anthony Chambers <dockerfiles@anthonychambers.co.uk>

# Volume that you can use to mount the host filesystem on
VOLUME /var/www/html

# Add PHP extensions and enable
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable pdo_mysql

# Add Apache vhost, disable default and enable new vhost
ADD vhost.conf /etc/apache2/sites-available/
RUN a2dissite 000-default.conf
RUN a2ensite vhost

# Enable Apache modules
RUN a2enmod rewrite

# Finally, restart Apache
RUN service apache2 restart