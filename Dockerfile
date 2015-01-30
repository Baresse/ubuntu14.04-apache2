FROM ubuntu:14.04

MAINTAINER pamtrak06 <pamtrak06@gmail.com>

RUN apt-get update && apt-get install -y apache2 apache2-threaded-dev

# Set Apache environment variables
#RUN source /etc/apache2/envvars

# Configure localhost in Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Define default command
CMD ["apachectl", "-D", "FOREGROUND"]

# Expose ports
EXPOSE 22 80 443
