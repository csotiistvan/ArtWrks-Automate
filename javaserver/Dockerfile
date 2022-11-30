# JETTY_HOME    =  /usr/local/jetty
# JETTY_BASE    =  /var/lib/jetty
# TMPDIR        =  /tmp/jetty

FROM jetty
COPY fileshare.jar usr/local/jetty/fileshare.jar

RUN java -jar "$JETTY_HOME/fileshare.jar" --add-to-startd=jmx,stats