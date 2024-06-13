#!/usr/bin/env bash

# Variables
remote_host="c4b97848bf35.7b3ea1d9.alu-cod.online"
remote_user="c4b97848bf35"
remote_pass="6e544e99b2b741998bbf"
remote_path="/summative/0524-2024m"
local_directory="negpod_15-q1"

# Create a tar.gz file for the directory
tar -czf "$local_directory.tar.gz" "$local_directory"

# Use scp to copy the file to the remote server
scp "$local_directory.tar.gz" "$remote_user@$remote_host:$remote_path"

# Verify if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup successful."
else
  echo "Backup failed."
fi
