#!/bin/bash

log_file="/var/log/scripts"
user_name=$(whoami)
current_time=$(date)

echo "Creating log file in  "$log_file""
sudo touch "$log_file"
sudo chmod 744 "$log_file"
sudo chown $user_name:$user_name /var/log/scripts

echo $current_time $user_name " executed script" >> $log_file
