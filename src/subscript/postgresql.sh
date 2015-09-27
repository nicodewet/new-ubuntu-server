#!/bin/bash

# http://askubuntu.com/questions/186610/how-do-i-upgrade-to-postgres-9-2
# https://wiki.postgresql.org/wiki/Apt

lsb_release -c
sudo touch /etc/apt/sources.list.d/pgdg.list
sudo nano /etc/apt/sources.list.d/pgdg.list
# add this line to the above file: deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
sudo wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
apt-cache search "postgresql-9.2"
sudo apt-get install postgresql-9.2
# config dir:
ls /etc/postgresql/9.2/main
# data dir:
ls /var/lib/postgresql/9.2/main
# http://blog.chinnukannalucky.com/install-and-configure-postgresql-9-2-on-ubuntu/
sudo su postgres -c psql template1
template1=# ALTER USER postgres WITH PASSWORD 'danielchristiaan';
template1=# \q
sudo passwd -d postgres
sudo su postgres -c passwd # same password

postgres=# CREATE USER vouchserv WITH password 'vouchserv';
postgres=# CREATE DATABASE vouchserv OWNER vouchserv;
postgres-# \l
postgres@leonidas:~$ psql -d vouchserv -U vouchserv -W
postgres=# SELECT rolname FROM pg_roles;

# logging in not working, replacing "local", IPv4 and IPv6 with trust
k7@leonidas:~$ sudo nano /etc/postgresql/9.2/main/pg_hba.conf
k7@leonidas:~$ su - postgres
postgres@leonidas:~$ /usr/lib/postgresql/9.2/bin/pg_ctl reload
# the above command, to reload the conf without a server restart, asked for the data directory to be specified
postgres=# SHOW data_directory;
postgres@leonidas:~$ /usr/lib/postgresql/9.2/bin/pg_ctl reload -D /var/lib/postgresql/9.2/main
# trust authentication not very secure, replacing it with peer which requires an OS user
# as per: http://www.postgresql.org/docs/9.2/static/auth-methods.html

sudo useradd -d /home/vouchserv -m vouchserv
sudo passwd vouchserv
# ascertain which users exist:
cat /etc/passwd
# making sure that only specific users can ssh in since system users will not necessarily have a secure password:
grep AllowUsers /etc/ssh/sshd_config
# add in line at end of the above to only allow ssh access to user k7
sudo service ssh restart
# replacing "local", IPv4 and IPv6 with peer
sudo nano /etc/postgresql/9.2/main/pg_hba.conf
k7@leonidas:/root$ psql -d vouchserv -U vouchserv -f 01-04-2013/0.0.33/2_postgresql.create.sql
k7@leonidas:/root$ psql -d vouchserv -U vouchserv
vouchserv=> \dt
                List of relations
 Schema |        Name         | Type  |   Owner
--------+---------------------+-------+-----------
 public | ROLE                | table | vouchserv
 public | USER                | table | vouchserv
 public | USER_ROLE           | table | vouchserv
 public | VOUCHER             | table | vouchserv
 public | VOUCHER_BATCH       | table | vouchserv
 public | VOUCHER_BATCH_OWNER | table | vouchserv
(6 rows)


