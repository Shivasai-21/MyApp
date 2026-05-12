FROM tomcat:8.5-jdk8

# Copy custom config
COPY tomcat-users.xml /usr/local/tomcat/conf/

# Copy your WAR file
COPY target/myweb-8.7.0.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
