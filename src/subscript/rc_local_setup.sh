#!/bin/bash

##########
#
# This script overwrites the /etc/rc.local script with our rc.local script
#
# rc are command scripts for system startup. rc is the command script that is invoked by init 
# when the system starts up. rc.local scripts hold commands which are pertinent only to a 
# specific site.
#
# @see http://www.openbsd.org/cgi-bin/man.cgi?query=rc.local&sektion=8
#
##########

FILE="/etc/rc.local"
echo "overwriting $FILE"
echo "before..."
echo ">>>>>>"
cat $FILE
echo "<<<<<<"
cp rc.local $FILE
echo "after..."
echo ">>>>>>"
cat $FILE
echo "<<<<<<"
