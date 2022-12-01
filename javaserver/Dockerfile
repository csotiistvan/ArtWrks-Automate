FROM ubuntu:18.04
COPY fileshare.jar /home/ubuntu/fileshare.jar

RUN apt-get update
RUN apt install -y default-jre
RUN apt install -y webhook
#Placeholder:
CMD echo  "fileshare.jar should run now"
# CMD java -jar "/home/ubuntu/fileshare.jar"

# FROM eclipse-temurin:11
# LABEL version="0.2"
# LABEL env="no idea tbh"
# RUN mkdir /opt/app
# COPY fileshare.jar /opt/app

# CMD ["java", "-jar", "/opt/app/fileshare.jar"]