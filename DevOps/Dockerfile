#building a containerized webapp that runs on apache2 server

#ubuntu OS as the base image
FROM ubuntu
#label 
LABEL "Author"="GC"
#adding enviornment variable to make shell non interactive 
ENV DEBIAN_FRONTEND=noninteractive 
#run instructions 
RUN apt update && apt install apache2 -y
#instruction to start the apache2 process  
CMD ["/usr/sbin/apachectl", "-D", FOREGROUND]
#running on port 80
EXPOSE 80
#working directory to automatically changing to the dir
WORKDIR /var/www/html
#log volume 
VOLUME /var/log/apache2
#add instruction to add or unzip the source file
ADD filename.tar.gz /var/www/html
