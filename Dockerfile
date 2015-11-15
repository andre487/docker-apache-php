FROM debian:jessie

MAINTAINER andre487 "andrey.prokopyuk@gmail.com"

RUN apt-get update \
    && apt-get install -y apache2 libapache2-mod-php5 php5-mysql \
    && apt-get clean \
    && ls /etc/apache2/sites-enabled | xargs -I % rm /etc/apache2/sites-enabled/% \
    && ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load \
    && ln -sf /dev/stdout /var/log/apache2/access.log \
    && ln -sf /dev/stderr /var/log/apache2/error.log

COPY provision/apache2.conf /etc/apache2/apache2.conf
COPY provision/start.sh /etc/container/start.sh

CMD /etc/container/start.sh