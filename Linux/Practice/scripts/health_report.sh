#!/bin/bash

echo -e "---System uptime is:$(uptime)---\n" >> /home/marian/Documents/work/Linux/Practice/logs/health_report_$(date +%F).log
echo -e "---Used memory : $(free -m)" >> /home/marian/Documents/work/Linux/Practice/logs/health_report_$(date +%F).log
echo -e "\n---Disk usage: $(df -h)" >> /home/marian/Documents/work/Linux/Practice/logs/health_report_$(date +%F).log
echo -e "\n---Top 5 conssuming processes: $(ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head -5)" >> /home/marian/Documents/work/Linux/Practice/logs/health_report_$(date +%F).log 


