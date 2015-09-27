#!/bin/bash

echo "Type the password for the admin user to access the tomcat manager webapp and tomcat host-manager webapp, followed by [ENTER]:"
read -s -p "Enter Password: " PASSWD
FILE="/etc/tomcat7/tomcat-users.xml"
echo "configuring $FILE"
cp templates/tomcat-users.xml $FILE
/bin/sed -i "s/PASSWORD/$PASSWD/" $FILE
echo "done configuring $FILE"
service tomcat7 restart
