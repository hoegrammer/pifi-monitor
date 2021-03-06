#! /bin/bash


identity=`grep -o '^\S*' /home/pi/zabbix/identity.txt` # don't allow spaces
server=`grep -o '^\S*' /home/pi/zabbix/server.txt` # don't allow spaces
interface=`grep -o '^\S*' /home/pi/zabbix/interface.txt`

ip=`/sbin/ifconfig $interface | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1 }'`

results=`/usr/local/bin/speedtest-cli --server 1727 --source $ip --simple` # 1727 = GRNET server, simple = not verbose output

echo -e "\n\n"
date
echo "Speed Test ($identity)"
echo $results
pingtime=`echo $results | grep -o 'Ping\: [0-9\.]* ms' | grep -o '[0-9\.]*'` 
download=`echo $results | grep -o 'Download\: [0-9\.]* Mbit\/s' | grep -o '[0-9\.]*'`
upload=`echo $results | grep -o 'Upload\: [0-9\.]* Mbit\/s' | grep -o '[0-9\.]*'`

## For debugging
# pingtime=170
# download=28
# upload=12

send_cmd="zabbix_sender -z $server -s $identity --tls-connect psk --tls-psk-identity $identity --tls-psk-file /home/pi/zabbix/psk.txt"

$send_cmd -k speedtest.pingtime -o $pingtime
$send_cmd -k speedtest.upload -o $upload
$send_cmd -k speedtest.download -o $download
