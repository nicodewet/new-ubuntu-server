#!/bin/bash

# See: https://help.ubuntu.com/community/AutomaticSecurityUpdates/
echo "Configuring automatic security updates"
/usr/bin/apt-get install unattended-upgrades
/usr/bin/sudo unattended-upgrade
if [ $? -ne 0 ]; then
        echo "ERROR: failure in unattended-upgrade execution"
        exit 1
fi
# Details of what the output of the below values mean can be found in the header
# of the /etc/cron.daily/apt file
echo "================= CONFIG OUTPUT =================="
/bin/cat /etc/apt/apt.conf.d/50unattended-upgrades
