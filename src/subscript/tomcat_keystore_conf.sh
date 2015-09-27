#!/bin/bash

echo " >>>>> Tomcat keystore creation and CA certificate creation..."

UNZIP_DIR="certs"
if [ ! -d "$UNZIP_DIR" ]; then
	dpkg-query -l unzip
	if [ $? -ne 0 ]; then
        	echo "installing unzip"
        	apt-get install unzip
	fi

	DIR="/root/scripts/etc/www_vouchertool_com"
	EXT=".zip"
	FILE="$DIR$EXT"

	unzip $FILE -d $UNZIP_DIR
	ls $UNZIP_DIR
fi

keytool -import -alias root -keystore tomcat.keystore -trustcacerts -file certs/PositiveSSLCA2.crt
keytool -import -alias tomcat -keystore tomcat.keystore -file certs/www_vouchertool_com.crt

