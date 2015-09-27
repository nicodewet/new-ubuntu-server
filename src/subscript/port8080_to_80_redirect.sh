#!/bin/bash

##########
#
# WARNING iptables changes won't survive a server restart and so this script must be run
# by command script(s) invoked by init when the system starts up.
#
# @see rc_local_setup.sh and its accompanying rc.local script
#
##########

# --numeric|-n
# --tcp|-t
# --listening|-l
netstat -ntl

# 	  PORT REDIRECTION RULES 
#
# 1. This specifies -t nat to indicate the nat table. Note rules are added to the filter table by default.
# 2. This rule appends (-A) which means add the rule to the bottom of the list.
# 3. This rule is added to the PREROUTING chain.
# 4. For the tcp protocol (-p tcp).
# 5. The destination port (--dport) is 80 - this is the port that the client is trying to access on your server.
# 6. The traffic is jumped (-j) to the REDIRECT action. This is the action that is taken when the rule matches.
# 7. 
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8443

# PURPOSE: Integration test rules. The following two rules redirects traffic from two IP addresses on port 80 to port 
# 8002 where we expect a Jenkins job to be running and listening on port 8002. 
#
# For a manual check of the rules below, run <$sudo nc -l -v 8002> then from any of the hosts below (e.g. 202.55.100.10)
# you can ssh in and execute <$nc -v -z 31.222.137.9>
iptables -t nat -I PREROUTING 1 -p tcp -s 202.55.100.10 --dport 80 -j REDIRECT --to-port 8002
iptables -t nat -I PREROUTING 2 -p tcp -s 202.55.101.35 --dport 80 -j REDIRECT --to-port 8002 

# TODO comment
iptables -t nat -L
# TODO comment
iptables -t nat -A OUTPUT -d localhost -p tcp --dport 80 -j REDIRECT --to-ports 8080
iptables -t nat -A OUTPUT -d localhost -p tcp --dport 80 -j REDIRECT --to-ports 8443

###############################################
# RMI rules for vouchserv 
#
# voucherserv has an RMI registry on port 8084
###############################################

# Anything coming from localhost on port 8084 accept
# iptables -A INPUT -i lo -p tcp --dport 8084 -j ACCEPT
# Drop anyting coming into port 8084
# iptables -A INPUT -p tcp --dport 8084 -j DROP

# iptables -A INPUT -i lo -j ACCEPT
# iptables -A OUTPUT -o lo -j ACCEPT
