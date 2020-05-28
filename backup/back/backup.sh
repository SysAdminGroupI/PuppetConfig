#!/bin/bash
rsync -azP /etc/hostname i@10.25.137.160:~/backup/back/
rsync -azP /etc/hosts i@10.25.137.160:~/backup/back/
rsync -azP /etc/nagios/nrpe.cfg i@10.25.137.160:~/backup/back/nrpe/
rsync -azP ~/prometheus-2.18.1.linux-amd64/ i@10.25.137.160:~/backup/back/prometheus/prometheus/
rsync -azP ~/node_exporter-1.0.0-rc.0.linux-amd64/ i@10.25.137.160:~/backup/back/prometheus/node-exporter/
rsync -azP ~/backup.sh i@10.25.137.160:~/backup/back/
