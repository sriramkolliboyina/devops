FROM alpine

RUN apt-get -y update
RUN apt-get -y install openjdk-8-jdk wget
WORKDIR /opt/tomcat/webapps

RUN apt-get install -y tomcat9

COPY stsdevops/docker/images/code/sampleapp.war  /var/lib/tomcat/webapps/

EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
