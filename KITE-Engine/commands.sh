#!/bin/bash
bash /opt/tomcat/apache-tomcat-9.0.43/bin/startup.sh
nohup java -jar /scripts/selenium-server-standalone-3.141.59.jar -role hub &
nginx
cd /KITE-FTP-Simplified && java -jar target/KITE-FTP-jar-with-dependencies.jar configs/config-sample.json