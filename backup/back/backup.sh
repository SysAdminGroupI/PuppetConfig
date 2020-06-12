#!/bin/bash
rsync -azP /etc/hostname i@10.25.137.160:~/backup/back/
rsync -azP /etc/hosts i@10.25.137.160:~/backup/back/
rsync -azP /etc/nagios/nrpe.cfg i@10.25.137.160:~/backup/back/nrpe/
rsync -azP ~/prometheus-2.18.1.linux-amd64/ i@10.25.137.160:~/backup/back/prometheus/prometheus/
rsync -azP ~/node_exporter-1.0.0-rc.0.linux-amd64/ i@10.25.137.160:~/backup/back/prometheus/node-exporter/
mysqldump -u student -A --add-drop-database --add-locks > ~/db-backup.sql
mysqldump -u student owncloud --add-locks > ~/owncloud-backup.sql
mysqldump -u student mysql --add-locks > ~/mysql-backup.sql
rsync -azP ~/db-backup.sql i@10.25.137.160:~/backup/back/
rsync -azP ~/owncloud-backup.sql i@10.25.137.160:~/backup/back/
rsync -azP ~/mysql-backup.sql i@10.25.137.160:~/backup/back/
rsync -azP ~/backup.sh i@10.25.137.160:~/backup/back/
