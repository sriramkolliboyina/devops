FROM tomcat:9 as build
WORKDIR /usr/local/tomcat/webapps
COPY /stsdevops/docker/images/code/sampleapp.war /usr/local/tomcat/webapps
########
FROM scratch
COPY --from=build /usr/local/tomcat/webapps/sampleapp.war
RUN chmod -R 755 /usr/local/tomcat/webapps/sampleapp.war




#FROM ubuntu as build
#cmd sudo apt-get install -y tomcat9

#WORKDIR /usr/local/tomcat/webapps

#FROM ubuntu
#COPY --from=build /usr/local/tomcat/webapps /target/*.war
