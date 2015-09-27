#!/bin/bash

SSH_PORT="54035"

if [ $# -ne 1 ]; then
	echo "No arguments supplied, supply sudoer username"
	exit 1
fi
ADMIN_USER=$1
if [ "$EUID" -ne 0 ]; then
    echo "ERROR: You should be root or your EUID should be 0"
    exit 1
fi
echo "New cloud server admin: 1. adding sudoer $ADMIN_USER 2. disabling root"
# To later delete the user, execute the following:
# userdel -f $ADMIN_USER
/usr/sbin/useradd -d /home/$ADMIN_USER -m $ADMIN_USER -s /bin/bash
/usr/bin/passwd $ADMIN_USER
if [ $? -ne 0 ]; then
        echo "ERROR: Could not update new user password, please run this script again"
        userdel -f $ADMIN_USER
        exit 1
fi
echo "$ADMIN_USER  ALL=(ALL:ALL) ALL" >> /etc/sudoers
# Validate the change to /etc/sudoers:
/usr/sbin/visudo -c
if [ $? -ne 0 ]; then
        echo "ERROR: Your /etc/sudoers file has been corrupted"
        exit 1
fi
# disable root account
/usr/bin/passwd -dl root
# disable ssh root logins
/bin/sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo "SECURITY CONFIG: ssh root logins disabled"
# change default ssh port
/bin/sed -i "s/Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
echo "SECURITY CONFIG: ssh no longer available on port 22, rather $SSH_PORT"
# Validate the change to /etc/ssh/sshd_config
/usr/sbin/sshd -t
if [ $? -ne 0 ]; then
        echo "ERROR: Check your sshd config file syntax"
        exit 1
fi
/etc/init.d/ssh restart
