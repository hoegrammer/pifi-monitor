#! /bin/bash

identity=`grep -o '^\S*' /home/pi/zabbix/identity.txt` # don't allow spaces
server=`grep -o '^\S*' /home/pi/zabbix/server.txt` # don't allow spaces
interface=`grep -o '^\S*' /home/pi/zabbix/interface.txt`

# a host on the internet that should always respond to ping
host=8.8.8.8

echo -e "\n\n"

send_cmd="zabbix_sender -z $server -s $identity --tls-connect psk --tls-psk-identity $identity --tls-psk-file /home/pi/zabbix/psk.txt"

interface_down=`fping -I $interface -uq -t500 $host`

if [ ${#interface_down} -ne 0 ]; then
    output="DOWN $interface `date`"
else
    output="OK $interface `date`"
fi

echo "Heartbeat: $output"

$send_cmd -k heartbeat.up -o "$output"
