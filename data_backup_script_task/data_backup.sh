#!/bin/bash

backup_files="/var/www"

dest="/var/lib/backups"

date=www-backup-$(date '+%Y-%m-%d')

archive_file="$date.tar.gz"

tar czf $dest/$archive_file $backup_files

# 0 0 * * * bash /home/azamat/data_backup.sh
