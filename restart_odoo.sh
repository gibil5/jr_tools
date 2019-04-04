#!/bin/bash

LOG=/root/jr_tools/restart.log

SERVICE=odoo.py

#FULL=/usr/bin/odoo.py --config=/etc/odoo/openerp-server.conf



# Odoo service
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
	echo "1"
	echo "$SERVICE is running well at `date`" >> $LOG 
else
	echo "2"
	echo "$SERVICE is not running. Restarting... at `date`" >> $LOG 

        systemctl restart odoo
fi


# IP Address
#PS1=$(ifconfig $(route -n | grep ^0.0.0.0 | awk '{print $NF}') | grep inet | grep -v inet6 | awk '{print $2}')
PS1=$(/usr/sbin/ifconfig $(route -n | grep ^0.0.0.0 | awk '{print $NF}') | grep inet | grep -v inet6 | awk '{print $2}')
echo "3"
echo "$PS1" >> $LOG 
echo "" >> $LOG 




