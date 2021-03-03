FROM php:7.2-apache
RUN a2enmod rewrite
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install bcmath
RUN apt-get update -y && apt-get install -y libpng-dev libgmp-dev
RUN docker-php-ext-install gd
RUN docker-php-ext-install gmp

#RUN apt-get update && apt-get install php-gd
#RUN apt-get update && apt-get install php7.2-gmp

COPY assets /var/www/assets
COPY commands /var/www/commands
COPY components /var/www/components
COPY config /var/www/config
COPY controllers /var/www/controllers
COPY mail /var/www/mail
COPY logs /var/www/logs
COPY models /var/www/models
COPY runtime /var/www/runtime
COPY views /var/www/views
COPY widgets /var/www/widgets
COPY vendor /var/www/vendor
#this is the trick
COPY web /var/www/html
COPY requirements.php /var/www/html
RUN mv /var/www/config/db-docker.php /var/www/config/db.php
RUN chown -R www-data:www-data /var/www
