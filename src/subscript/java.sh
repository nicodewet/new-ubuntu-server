#!/bin/bash
#######################################
# Personal Package Archive (PPA) method
#######################################
# Update the Package Index (available repositories defined in the
# /etc/apt/sources.list file)

/usr/bin/apt-get update
if [ $? -ne 0 ]; then
        echo ">>> failed to update package index, exiting..."
        exit 1
fi
/usr/bin/apt-get install python-software-properties
if [ $? -ne 0 ]; then
        echo ">>> failed to add required package for add-apt-repository"
        exit 1
fi
# Add external APT repository to either /etc/apt/sources.list or a file
# in /etc/apt/sources.list.d/.
/usr/bin/add-apt-repository ppa:webupd8team/java
if [ $? -ne 0 ]; then
        echo ">>> failed to add apt repository, exiting..."
        exit 1
fi
# Update the Package Index (available repositories defined in the
# /etc/apt/sources.list file)
/usr/bin/apt-get update
if [ $? -ne 0 ]; then
        echo ">>> failed to update package index, exiting..."
        exit 1
fi
# Download and install (the latest) Oracle JDK7 This package also
# installs packages we don't want on a server, but we'll live with this
# for now
/usr/bin/apt-get install oracle-java7-installer
if [ $? -ne 0 ]; then
        echo ">>> failed to download and install Oracle JDK7, exiting..."
        exit 1
fi
# Validation
java -version
if [ $? -ne 0 ]; then
        echo ">>> java command not available, PPA method failed, try wget based download"
        # wget --no-cookies --header "Cookie:
        # gpw_e24=http%3A%2F%2Fwww.oracle.com"
        # "http://download.oracle.com/otn-pub/java/jdk/7u5-b05/jdk-7u5-linux-x64.tar.gz"
        exit 1
fi
