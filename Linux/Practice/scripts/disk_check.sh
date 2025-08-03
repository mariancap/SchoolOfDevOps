#!/bin/bash

echo "---- Disk Check on: $(date '+%F %T') ----" >> /home/marian/Documents/work/Linux/Practice/logs/disk_report.log
df -h >> /home/marian/Documents/work/Linux/Practice/logs/disk_report.log
echo "" >> /home/marian/Documents/work/Linux/Practice/logs/disk_report.log


