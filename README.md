# pifi-monitor
Raspi network monitor that sends info to zabbix from behind a firewall

- set up hosts, items etc on zabbix server 
- install raspbian or similar
- install zabbix agent from https://github.com/imkebe/zabbix3-rpi
- install fping
- clone repo into home directory
- change name of directory to "zabbix"
- set up cron (see sample)
- remove ".sample" from the filenames and follow the instructions inside them
