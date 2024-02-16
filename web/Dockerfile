FROM ubuntu
MAINTAINER Poonam
LABEL name=web
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install php -y
RUN apt-get install php-mysql -y
WORKDIR /var/www/html
RUN rm index.html
ADD . .
RUN rm Dockerfile
RUN chown www-data:www-data . -R
CMD ["apache2ctl", "-D" , "FOREGROUND"]
                                                                                                                                             
                                      
