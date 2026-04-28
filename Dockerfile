FROM tomcat:8.5-jdk8

# Copy custom config
COPY tomcat-users.xml /usr/local/tomcat/conf/

# Copy your WAR file
COPY target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080
