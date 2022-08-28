# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "K-TechService" 
COPY ./webapp/webapp.war /usr/local/tomcat/webapps

