#!/bin/bash

#declare variables
src_dir="/home/helloxonie/Documents/backthisup" #the folder I'm backing up
backup_dir="/home/helloxonie/Documents/mybackups" #the folder the backups will be stored
timestamp=$(date +"%Y%m%d_%H%M%S") #timestamp for the backup file
backup_file="backup_$timestamp.tar.gz" #backup file name

#check if directory exists
echo "checking if the source directory exists"
ls "$src_dir"

if [ ! -d "$src_dir" ]; then
	echo "This source directory does not exist: $src_dir"
	exit 1
fi

#mkdir -p "$backup_dir"

tar -czf "$backup_dir/$backup_file" "$src_dir"

if [ $? -eq 0 ]; then
	echo "Backup successful: $backup_dir/$backup_file"
else
	echo "Backup failed"
	exit 1
fi
