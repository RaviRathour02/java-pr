FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY ./*.war /usr/local/tomcat/webapps
ENV TOMCAT_USER=admin
ENV TOMCAT_PASSWORD=admin
EXPOSE 8080
CMD ["/root/apache-tomcat-9.0.95/bin/startup.sh", "run"]




