FROM eclipse-temurin:11
LABEL version="0.2"
LABEL env="testing"
RUN mkdir /opt/app
COPY fileshare.jar /opt/app
RUN curl -fsSL https://raw.githubusercontent.com/csotiistvan/Docker-redeploy-with-webhooks/main/.env > /opt/app/.env
RUN curl -fsSL https://raw.githubusercontent.com/csotiistvan/Docker-redeploy-with-webhooks/main/startup.sh > /opt/app/startup.sh
RUN chmod 777 /opt/app/startup.sh

CMD bash /opt/app/startup.sh