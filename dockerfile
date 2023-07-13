FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install openjdk-8-jdk wget
WORKDIR /opt/tomcat/webapps

RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.55/bin/apache-tomcat-8.5.55.tar.gz -O /tmp/tomcat.tar.gz

RUN cd /tmp && tar xvfz tomcat.tar.gz

RUN mv /tmp/apache-tomcat-8.5.55 /opt/tomcat

COPY stsdevops/docker/images/code/sampleapp.war  /opt/tomcat/webapps/

EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
