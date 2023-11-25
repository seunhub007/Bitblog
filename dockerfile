FROM php:8.1-apache
RUN mkdir -p /var/www/html
COPY . /var/www/html
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apt-get -y upgrade
RUN apt-get -y update 
RUN apt-get -y install vim
RUN apt-get -y install nodejs