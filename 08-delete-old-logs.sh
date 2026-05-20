#!/bin/bash

source="/home/ec2-user"
file_to_delete=$(find $source -name "*.log" -mtime +14)
echo " the files that would be deleted are $file_to_delete"

while read -r oldfile
do
    echo " deleting $oldfile"
    rm -rf $oldfile
    echo "deleted $oldfile"
done <<< $file_to_delete