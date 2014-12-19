FROM ubuntu:14.04

MAINTAINER pamtrak06 <pamtrak06@gmail.com>

# Update packages sources
RUN echo "deb http://ppa.launchpad.net/kubuntu-ppa/backports/ubuntu trusty-security main restricted" >> /etc/apt/sources.list

# Update os & install Apache
RUN apt-get install -y \
  libpcre3-dev \
  libaprutil1-dev \
  libapr1-dev \
  apache2 \
  libapache2-mod-wsgi \
  apache2-threaded-dev

# Set Apache environment variables
#RUN source /etc/apache2/envvars

# Configure localhost in Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Volumes
VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]

# Expose ports
EXPOSE 22 80 443

# Define default command
CMD ["apachectl", "-D", "FOREGROUND"]
