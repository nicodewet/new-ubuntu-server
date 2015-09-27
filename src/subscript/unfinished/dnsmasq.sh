#!/bin/bash

# TODO document the config done here
321  13/03/13 09:56:31 sudo apt-get install dnsmasq
322  13/03/13 09:57:12 ls -al /etc/dnsmasq.conf
323  13/03/13 09:57:23 sudo nano /etc/dnsmasq.conf
324  13/03/13 10:00:12 sudo nano /etc/dhcp3/dhclient.conf
325  13/03/13 10:00:46 ls /etc/dhcp3/
326  13/03/13 10:00:53 ls /etc/dhcp
327  13/03/13 10:01:31 sudo /etc/dhcp/dhclient.conf
328  13/03/13 10:01:47 sudo nano /etc/dhcp/dhclient.conf
329  13/03/13 10:03:15 sudo nano /etc/resolv.conf
330  13/03/13 10:04:38 sudo /etc/init.d/dnsmasq restart
331  13/03/13 10:05:00 dig ubuntu.com
332  13/03/13 10:06:00 dig vouchertool.com
333  13/03/13 10:07:14 nslookup www.vouchertool.com
334  13/03/13 10:11:16 ls /run/
335  13/03/13 10:11:45 sudo mv /etc/resolv.conf /run/resolvconf/resolv.conf
336  13/03/13 10:14:53 sudo ln -s ../run/resolvconf/resolv.conf /etc/resolv.conf
337  13/03/13 10:16:29 sudo /etc/init.d/dnsmasq restart
338  13/03/13 10:16:41 dig ubuntu.com
339  13/03/13 10:17:02 man dig