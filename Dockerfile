FROM php:7.2-apache

LABEL org.opencontainers.image.source="https://github.com/foertel/oidc_webfinger"


COPY src/ /var/www/html/

RUN a2enmod rewrite headers