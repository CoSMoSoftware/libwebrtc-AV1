FROM openjdk:8-jdk-alpine
# ----
# Install Maven
RUN apk add --no-cache curl tar bash git openssh-client npm nginx openrc 
RUN mkdir ~/.ssh
RUN ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts
ARG MAVEN_VERSION=3.3.9
ARG USER_HOME_DIR="/root"
RUN mkdir -p /usr/share/maven && \
curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -xzC /usr/share/maven --strip-components=1 && \
ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
# ----
# Install project dependencies and keep sources
RUN wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.43/bin/apache-tomcat-9.0.43.tar.gz -P /tmp
RUN mkdir /opt/tomcat
RUN tar xf /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat
RUN sh -c 'chmod +x /opt/tomcat/apache-tomcat-9.0.43/bin/*.sh'	
RUN npm install -g allure-commandline
# make source folder
RUN mkdir -p /var/www/allure 
RUN chmod 777 -R /var/www/allure
RUN git clone https://github.com/CoSMoSoftware/KITE-FTP-Simplified
RUN git clone https://github.com/CoSMoSoftware/Kdash-Upload-Servlet
WORKDIR /KITE-FTP-Simplified/
RUN mvn install
WORKDIR /Kdash-Upload-Servlet/
RUN git checkout docker
RUN mvn install
RUN cp target/kdash.war /opt/tomcat/apache-tomcat-9.0.43/webapps
RUN /opt/tomcat/apache-tomcat-9.0.43/bin/startup.sh 

RUN mkdir /scripts
ADD nginx.conf /etc/nginx/conf.d/nginx.conf
RUN mkdir /run/nginx
ADD commands.sh /scripts/commands.sh
RUN chmod +x /scripts/commands.sh
ENTRYPOINT ["bash", "/scripts/commands.sh"]