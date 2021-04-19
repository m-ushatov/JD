FROM ubuntu

RUN apt -y update
RUN apt -y -2install apache2

RUN echo 'Hello from Docker' > /var/www/html/index.html

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
EXPOSE 80
