#!/bin/bash
rsync -azP /etc/hostname i@10.25.137.160:~/backup/db
rsync -azP /etc/hosts i@10.25.137.160:~/backup/db
rsync -azP /etc/nagios/nrpe.cfg i@10.25.137.160:~/backup/db/nrpe/
sudo mysqldump -A --add-drop-database --add-locks > ~/db-backup.sql
rsync -azP ~/db-backup.sql i@10.25.137.160:~/backup/db/
rsync -azP ~/backup.sh i@10.25.137.160:~/backup/db/
