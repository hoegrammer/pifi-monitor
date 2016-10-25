# pifi-monitor
Raspi network monitor that sends info to zabbix from behind a firewall

- set up hosts, items etc on zabbix server 
- install raspbian or similar
- sudo apt-get install libltdl7 libodbc1 fping
- get zabbix sender package from https://github.com/imkebe/zabbix3-rpi and install it with dpkg
- clone this repo into home directory
- change name of directory to "zabbix"
- set up cron (see sample)
- remove ".sample" from the filenames and follow the instructions inside them
