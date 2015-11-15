FROM debian:jessie

MAINTAINER andre487 "andrey.prokopyuk@gmail.com"

RUN apt-get update \
    && apt-get install -y apache2 libapache2-mod-php5 php5-mysql php5-gd \
    && apt-get clean \
    && ls /etc/apache2/sites-enabled | xargs -I % rm /etc/apache2/sites-enabled/% \
    && ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

COPY provision/apache2.conf /etc/apache2/apache2.conf
COPY provision/php.ini /etc/php5/apache2/php.ini
COPY provision/start.sh /etc/container/start.sh

CMD /etc/container/start.sh
