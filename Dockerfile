FROM php:8.2-apache

LABEL org.opencontainers.image.source="https://github.com/foertel/oidc_webfinger"

COPY src/ /var/www/html/

RUN { \
		echo '<Directory "/var/www/html">'; \
		echo '\tSetEnvIf Remote_Addr "127.0.0.1" is_check=true'; \
		echo '</Directory>'; \
} | tee "$APACHE_CONFDIR/conf-enabled/disable-local-logging.conf"; \
sed -i '/CustomLog ${APACHE_LOG_DIR}\/access.log combined/s/$/ env=!is_check/' /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite headers

HEALTHCHECK --interval=1s --timeout=1s --start-period=5s \
  CMD curl -f http://localhost/.well-known/webfinger?resource=a || exit 1