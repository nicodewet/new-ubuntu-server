#!/bin/bash
197  16/02/13 03:03:14 sudo nano /etc/default/jenkins
  198  16/02/13 03:14:26 cat /etc/default/jenkins
  199  16/02/13 03:15:59 sudo service jenkins restart
  200  16/02/13 03:16:41 tail /var/log/jenkins/jenkins.log
  201  16/02/13 03:17:27 tail -f /var/log/jenkins/jenkins.log
  202  16/02/13 03:18:05 tail -n 1000 /var/log/jenkins/jenkins.log
  203  16/02/13 03:19:00 sudo service jenkins stop
  204  16/02/13 05:15:59 sudo nano /etc/default/jenkins
  205  16/02/13 05:18:28 sudo service jenkins start
  206  16/02/13 05:28:06 tail -n 100 /var/log/jenkins/jenkins.log
  207  16/02/13 05:28:57 sudo nano /etc/default/jenkins
  208  16/02/13 05:30:59 sudo service jenkins stop
  209  16/02/13 05:31:10 sudo service jenkins start
  210  16/02/13 05:31:35 tail /var/log/jenkins/jenkins.log
  211  16/02/13 05:32:17 less +G /var/log/jenkins/jenkins.log
  212  16/02/13 05:37:27 sudo nano /etc/default/jenkins
  213  16/02/13 05:38:58 sudo service jenkins stop
  214  16/02/13 05:39:09 sudo service jenkins start
  215  16/02/13 05:39:36 tail /var/log/jenkins/jenkins.log
  216  16/02/13 05:40:29 sudo nano /etc/default/jenkins
  217  18/02/13 00:41:15 cd /usr/share/jenkins/
  218  18/02/13 00:41:29 wget http://updates.jenkins-ci.org/download/war/1.480.3/jenkins.war
  221  18/02/13 00:41:59 sudo wget http://updates.jenkins-ci.org/download/war/1.480.3/jenkins.war
  223  18/02/13 00:43:29 service jenkins start
  224  18/02/13 00:43:42 sudo service jenkins start
  247  18/02/13 22:30:54 ls /etc/default/jenkins
  248  18/02/13 22:31:45 sudo find / -name jenkins
  249  18/02/13 22:33:22 ls /var/lib/jenkins/jobs/
  250  18/02/13 22:33:33 ls -al /var/lib/jenkins/jobs/
  251  18/02/13 22:34:07 cat /var/lib/jenkins/jobs/Smokey\ Smokey/
  252  18/02/13 22:34:14 cat /var/lib/jenkins/jobs/Smokey\ Smokey/config.xml
  253  18/02/13 22:36:16 sudo nano /var/lib/jenkins/jobs/Smokey\ Smokey/config.xml