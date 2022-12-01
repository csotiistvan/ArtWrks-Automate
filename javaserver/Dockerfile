# FROM httpd
# COPY fileshare.jar /usr/local/apache2/htdocs/fileshare.jar
# COPY index.html /usr/local/apache2/htdocs/test.html

# RUN apt-get update
# RUN apt-get install default-jre
# #RUN java -jar "/usr/local/apache2/htdocs/fileshare.jar"

FROM ubuntu:18.04
COPY fileshare.jar /home/ubuntu/fileshare.jar

RUN apt-get update
RUN apt install default-jre
# RUN java -jar "/home/ubuntu/fileshare.jar"