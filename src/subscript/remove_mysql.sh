#!/bin/bash

echo "mysql uninstall"
dpkg --get-selections | grep mysql
sudo apt-get --purge remove mysql-server
sudo apt-get --purge remove mysql-server-5.5
sudo apt-get --purge remove mysql-client-5.5
sudo ps aux | grep mysql