#!/bin/bash

TOMCAT_CONFIG_FILE="/etc/default/tomcat7"
# Note the use of @ as separator in sed below since we are dealing with paths

echo "Modifying $TOMCAT_CONFIG_FILE JAVA_OPTS..."

# TODO: JAVA_OPTS="-Djava.awt.headless=true -Xms320m -Xmx320m -XX:MaxPermSize=128m -XX:+UseConcMarkSweepGC"

echo "-Djava.awt.headless=true: "
echo "-Xms320m: "
echo "-Xmx320m: "
echo "-XX:MaxPermSize=128m: "
echo "-XX:+UseConcMarkSweepGC: "

# /bin/sed -i "s@#JAVA_HOME=/usr/lib/jvm/openjdk-6-jdk@JAVA_HOME=$TOMCAT_JAVA_HOME@" $TOMCAT_CONFIG_FILE


