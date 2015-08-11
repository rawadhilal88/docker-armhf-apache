FROM    armv7/armhf-ubuntu:latest
MAINTAINER  Rawad Hilal

RUN	apt-get update && apt-get install -y apache2 php5 libapache2-mod-auth-mysql php5-mysql && apt-get clean

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN /bin/ln -sf ../sites-available/default-ssl /etc/apache2/sites-enabled/001-default-ssl
RUN /bin/ln -sf ../mods-available/ssl.conf /etc/apache2/mods-enabled/
RUN /bin/ln -sf ../mods-available/ssl.load /etc/apache2/mods-enabled/
RUN /bin/ln -sf /etc/apache2/mods-available/socache_shmcb.load /etc/apache2/mods-enabled/socache_shmcb.load
RUN /bin/ln -sf /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

EXPOSE 80
EXPOSE 443

VOLUME /var/www

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
