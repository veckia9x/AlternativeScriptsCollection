#!/bin/bash

#xxxxxxxxxxxxxxx mysql_backup_script xxxxxxxxxxxxxxxx

# Def. Variables
host=
user=
p4th=
dia=$(date +%Y%m%d)

# Backup
cd $p4th
mysqldump -h$host -u$user -p$1 --all-databases >dump_$dia.sql

# Wrote_by_Veckia_(Alpha#9751_at_discord)
#xxxxxxxxxxxxxxx mysql_backup_script xxxxxxxxxxxxxxxx
