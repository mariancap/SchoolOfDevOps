#!/bin/bash

timestamp=$(date +%Y-%m-%d_%H-%M-%S)
dest=/home/marian/Documents/work/Linux/PracticeGitHub/backups
backup_name="documents_backup_$timestamp.tar.gz"
tar -czf $backup_name $1
mv $backup_name $dest

files_count=$(ls $dest | grep documents_backup* | wc -l)

if [ $files_count -gt 3 ];
then 
	cd $dest
	rm $(ls -1t | tail -1)
fi

