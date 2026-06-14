# Service Monitor & Auto Restart

## Description
A bash script that monitors critical Linux services
and automatically restarts them if they go down.

## Features
- Monitors multiple services simultaneously
- Auto restarts stopped services
- Color coded terminal output
- Activity logging with timestamp
- Detects and logs service failures
- Automated scheduling using cron

## Technologies Used
- Linux (Ubuntu)
- Bash Scripting
- systemctl
- cron

## Project Structure
service_monitor/
├── service_monitor.sh  # Main script
├── README.md           # Documentation
└── logs/               # Activity logs

## How to Run
# Clone the repo
git clone https://github.com/Babypriya-0317/service-monitor

# Give permission
chmod +x service_monitor.sh

# Run the script
bash service_monitor.sh

## Automate With Cron
# Open crontab
crontab -e

# Add this line to check every 5 minutes
*/5 * * * * /home/username/service_monitor/service_monitor.sh

## Remote Deployment
This project can be deployed on a remote Linux server.
- Use **PuTTY** to SSH into the remote server
  ssh username@server-ip
- Use **WinSCP** to transfer service_monitor.sh to server
- Then run the script on the server
  bash service_monitor.sh

## Sample Output
===============================
   SERVICE MONITOR REPORT
   Date: 2026-06-14_11-05-42
===============================
✅ ssh is RUNNING
✅ cron is RUNNING
✅ rsyslog is RUNNING
===============================
✅ Service Check Complete!
===============================
