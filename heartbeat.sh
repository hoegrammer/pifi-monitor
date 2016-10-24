#! /bin/bash

identity=`grep -o '^\S*' /home/pi/zabbix/identity.txt` # don't allow spaces
server=`grep -o '^\S*' /home/pi/zabbix/server.txt` # don't allow spaces

echo -e "\n\n"
date
echo "Heartbeat"
send_cmd="zabbix_sender -z $server -s $identity --tls-connect psk --tls-psk-identity $identity --tls-psk-file /home/pi/zabbix/psk.txt"

$send_cmd -k heartbeat.up -o "`date`"
