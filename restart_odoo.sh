#!/bin/bash

LOG=/root/jr_tools/restart.log

SERVICE=odoo.py

#FULL=/usr/bin/odoo.py --config=/etc/odoo/openerp-server.conf

if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
	echo "1"
	echo "$SERVICE is running well at `date`" >> $LOG 
else
	echo "2"
	echo "$SERVICE is not running. Restarting... at `date`" >> $LOG 

        systemctl restart odoo
fi
