#! /bin/bash
#
sudo yum install -y httpd
sleep 4s
#
sudo systemctl enable --now httpd
sleep 2s
sudo systemctl status httpd
#
echo "$(whoami)-$(date +%FT%H:%M:%S)...running_at_hostname: $HOSTNAME." > /var/www/html/index.html
#