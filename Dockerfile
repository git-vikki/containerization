FROM maven:latest
RUN apt-get update -y
WORKDIR /opt
COPY javawar /opt
RUN mvn -f /opt/pom.xml install
ADD https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.1/bin/apache-tomcat-9.0.1.tar.gz /opt
RUN tar -xvf apache-tomcat-9.0.1.tar.gz
EXPOSE 8081
CMD ["/opt/apache-tomcat-9.0.1/bin/catalina.sh","run"]
RUN cp -R /opt/target/*.war /opt/apache-tomcat-9.0.1/webapps
