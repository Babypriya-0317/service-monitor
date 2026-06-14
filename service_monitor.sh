#!/bin/bash

# ---- COLORS ----
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# ---- CONFIGURATION ----
LOG_FILE="/home/babypriyaa/service_monitor/logs/service_monitor.log"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# ---- SERVICES TO MONITOR ----
SERVICES=("ssh" "cron" "rsyslog")

# ---- PRINT HEADER ----
echo -e "${BLUE}===============================${NC}"
echo -e "${BLUE}   SERVICE MONITOR REPORT${NC}"
echo -e "${BLUE}   Date: $DATE${NC}"
echo -e "${BLUE}===============================${NC}"

# ---- LOG HEADER ----
echo "===============================" >> $LOG_FILE
echo "Date: $DATE" >> $LOG_FILE
echo "SERVICE MONITOR REPORT" >> $LOG_FILE
echo "===============================" >> $LOG_FILE

# ---- CHECK EACH SERVICE ----
for SERVICE in "${SERVICES[@]}"; do

    # Check if service is running
    if systemctl is-active --quiet $SERVICE; then
        echo -e "${GREEN}✅ $SERVICE is RUNNING${NC}"
        echo "[$DATE] $SERVICE - RUNNING" >> $LOG_FILE
    else
        echo -e "${RED}❌ $SERVICE is DOWN!${NC}"
        echo "[$DATE] $SERVICE - DOWN! Attempting restart..." >> $LOG_FILE

        # Try to restart service
        sudo systemctl restart $SERVICE

        # Check if restart was successful
        if systemctl is-active --quiet $SERVICE; then
            echo -e "${YELLOW}🔄 $SERVICE restarted successfully!${NC}"
            echo "[$DATE] $SERVICE - Restarted Successfully" >> $LOG_FILE
        else
            echo -e "${RED}⚠️  $SERVICE restart FAILED!${NC}"
            echo "[$DATE] $SERVICE - Restart FAILED!" >> $LOG_FILE
        fi
    fi
done

echo -e "${BLUE}===============================${NC}"
echo -e "${GREEN}✅ Service Check Complete!${NC}"
echo -e "${BLUE}===============================${NC}"

echo "===============================" >> $LOG_FILE
echo "[$DATE] Service Check Complete" >> $LOG_FILE
echo "===============================" >> $LOG_FILE
