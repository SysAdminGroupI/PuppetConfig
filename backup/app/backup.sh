#!/bin/bash
rsync -azP /etc/hostname i@10.25.137.160:~/backup/app/
rsync -azP /etc/hosts i@10.25.137.160:~/backup/app/
rsync -azP /etc/nagios/nrpe.cfg i@10.25.137.160:~/backup/app/nrpe/
rsync -azP ~/Release.key i@10.25.137.160:~/backup/app/owncloud/
rsync -azP /etc/ssl/certs/apache-selfsigned.crt i@10.25.137.160:~/backup/app/owncloud/
rsync -azP /etc/apache2/conf-available/ssl-params.conf i@10.25.137.160:~/backup/app/owncloud/
rsync -azP /etc/apache2/sites-available/default-ssl.conf i@10.25.137.160:~/backup/app/owncloud/
rsync -azP /etc/apache2/sites-enabled/000-default.conf i@10.25.137.160:~/backup/app/owncloud/
rsync -azP ~/backup.sh i@10.25.137.160:~/backup/app/

