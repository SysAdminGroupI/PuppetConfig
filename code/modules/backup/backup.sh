#!/bin/bash
rsync -azP /etc/hostname i@10.25.137.160:~/backup/mgmt
rsync -azP /etc/hosts i@10.25.137.160:~/backup/mgmt
rsync -azP /etc/nagios3/htpasswd.users i@10.25.137.160:~/backup/mgmt/nagios3/
rsync -azP /etc/nagios3/nagios.cfg i@10.25.137.160:~/backup/mgmt/nagios3/
rsync -azP /etc/nagios-plugins/config/slack.cfg i@10.25.137.160:~/backup/mgmt/nagios-plugins/slack/
rsync -azP /usr/lib/nagios/plugins/nagios.pl i@10.25.137.160:~/backup/mgmt/nagios-plugins/slack/