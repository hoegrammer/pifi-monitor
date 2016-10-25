#! /bin/bash

identity=`grep -o '^\S*' /home/pi/zabbix/identity.txt` # don't allow spaces
server=`grep -o '^\S*' /home/pi/zabbix/server.txt` # don't allow spaces

echo -e "\n\n"
date
echo "APs"
send_cmd="zabbix_sender -z $server -s $identity --tls-connect psk --tls-psk-identity $identity --tls-psk-file /home/pi/zabbix/psk.txt"

aps_down=`fping -uq -t500 < aps.txt`

if [ ${#aps_down} -ne 0 ]; then
    output="Down: $aps_down"
else
    output="OK"
fi

echo $output

$send_cmd -k aps.up -o "$output"
