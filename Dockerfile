FROM debian:stable
COPY ./debian/etc/hosts /etc/hosts

#Packages installation
RUN apt-get update && apt-get install -y \
python3 \
python3-pip \
apache2 \
libapache2-mod-wsgi-py3 \
pip3 install pipenv
RUN ln /usr/bin/python3 /usr/bin/python


# Home dirrectory setting
RUN useradd -m www-site -s /bin/bash
ADD ./mycode /home/www-site/project/
COPY ./requirements.txt /home/www-site/project/
COPY ./setting_script /home/www-site/project/
WORKDIR /home/www-site/project


EXPOSE 80 443 8080
VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2", "/home/www-site/project"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

