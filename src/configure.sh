#!/bin/bash

# supply the username of your new sudoer as argument

echo $PATH

SPATH="$(dirname $0)"
. "$SPATH/subscript/sudoer_ssh.sh" $1
if [ $? -ne 0 ]; then
	echo "sudoer_ssh setup error"
	exit 1
fi
. "$SPATH/subscript/security.sh"
if [ $? -ne 0 ]; then
	echo "security setup error"
        exit 1
fi
. "$SPATH/subscript/java.sh"
if [ $? -ne 0 ]; then
	echo "java setup error"
        exit 1
fi
. "$SPATH/subscript/tomcat.sh"
if [ $? -ne 0 ]; then
	echo "tomcat setup error"
        exit 1
fi
. "$SPATH/subscript/port8080_to_80_redirect.sh"
if [ $? -ne 0 ]; then
        echo "port 8080 to 80 redirect setup error"
        exit 1
fi
. "$SPATH/subscript/tomcat_user.sh"
if [ $? -ne 0 ]; then
        echo "unable to update tomcat user"
        exit 1
fi
# commented out since postgresql.sh is not ready for use
# . "$SPATH/subscript/postgresql.sh"
# if [ $? -ne 0 ]; then
#        echo "unable to install postgresql server"
#        exit 1
# fi

