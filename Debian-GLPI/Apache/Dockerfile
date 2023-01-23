
FROM debian
LABEL key="value"

RUN apt-get update
RUN apt-get -y install apache2
RUN apt-get -y install php7.4
RUN apt-get -y install php-curl
RUN apt-get -y install php-fileinfo
RUN apt-get -y install php-gd
RUN apt-get -y install php-json
RUN apt-get -y install php-mbstring
RUN apt-get -y install php-mysqli
RUN apt-get -y install php-xml
RUN apt-get -y install php-intl


RUN rm -r /var/www/html

RUN mkdir /var/www/glpi
COPY ./glpi /var/www/glpi

RUN cp  /etc/apache2/sites-available/000-default.conf  /etc/apache2/sites-available/glpi.conf

ENV APACHE_DOCUMENT_ROOT /var/www/glpi

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN chown -R www-data. /var/www/glpi

RUN a2dissite 000-default.conf
RUN a2ensite glpi.conf
#RUN echo "Dockerfile Test on Apache2" > /var/www/html/index.html

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

