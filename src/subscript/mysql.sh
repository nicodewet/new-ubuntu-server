#!/bin/bash
# https://help.ubuntu.com/12.04/serverguide/mysql.html
echo "mysql installation"
apt-get install mysql-server
sudo netstat -tap | grep mysql
dpkg-reconfigure mysql-server-5.5
echo "finished mysql installation"
echo "administer mysql with: #mysql -u localhost -u root -p"
echo "import script file with: mysql db_name < script.sql > output.tab"
# # mysql vouchserv -u localhost -u root -p < cr.sql