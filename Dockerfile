#Taseef Rahman & Mahbubul Alam Palash
# we are extending everything from tomcat:8.0 image ...
FROM tomcat:8.0
MAINTAINER Mahbubul Alam Palash

# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat

COPY studentsurvey.war /usr/local/tomcat/webapps/
