# pifi-monitor
Raspi network monitor that sends info to zabbix from behind a firewall

- set up host, items etc on zabbix server 
- install raspbian or similar
- sudo apt-get update
- sudo apt-get install libltdl7 libodbc1 fping git arp-scan speedtest-cli
- get zabbix sender package from https://github.com/imkebe/zabbix3-rpi and install it with dpkg
- clone this repo into home directory
- change name of directory to "zabbix" 
- create /var/log/zabbix.log giving pi user write permissions
- set up cron (see sample)
- remove ".sample" from the filenames and follow the instructions inside them
- change the password for the pi user!!!

# If you want to monitor 2 networks with one pi

Create two hosts and clone the repo twice, into different directories, with different identity and psk. Remember to add both directory paths to crontab, and to change them where they are hard-coded in the scripts.
