#!/bin/bash

echo "Starting Apache Tomcat 7 Installation"
/usr/bin/apt-get install tomcat7 tomcat7-docs tomcat7-admin -y
if [ $? -ne 0 ]; then
        echo "ERROR: apt-get install failed"
        exit 1
fi
echo "Completed Apache Tomcat 7 Installation"
echo ""
TOMCAT_JAVA_HOME=$(/bin/readlink -f /usr/bin/javac | sed "s:bin/javac::")
TOMCAT_CONFIG_FILE="/etc/default/tomcat7"
# Note the use of @ as separator in sed below since we are dealing with paths
/bin/sed -i "s@#JAVA_HOME=/usr/lib/jvm/openjdk-6-jdk@JAVA_HOME=$TOMCAT_JAVA_HOME@" $TOMCAT_CONFIG_FILE
