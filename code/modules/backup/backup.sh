#!/bin/bash
rsync -azP /etc/hostname i@10.25.137.160:~/backup/mgmt
rsync -azP /etc/hosts i@10.25.137.160:~/backup/mgmt
