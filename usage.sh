#! /bin/bash

identity=`grep -o '^\S*' /home/pi/zabbix/identity.txt` # don't allow spaces
server=`grep -o '^\S*' /home/pi/zabbix/server.txt` # don't allow spaces
results=`sudo arp-scan --interface=wlan0 --localnet`
hostcount=`echo $results | grep -o '[0-9]* responded$' | grep -o '[0-9]*'`

echo -e "\n\n"
date
echo "Usage"

## For debugging
# hostcount=222

echo "$hostcount users online"

send_cmd="zabbix_sender -z $server -s $identity --tls-connect psk --tls-psk-identity $identity --tls-psk-file /home/pi/zabbix/psk.txt"


$send_cmd -k usage.hostcount -o $hostcount -vv
