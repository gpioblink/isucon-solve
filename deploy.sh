#!/bin/sh
set -v
now=$(date +%Y%m%d-%H%M%S)
branch=main
cd /home/isucon/private_isu/webapp/golang && /home/isucon/.local/go/bin/go build -o app && sudo systemctl restart isu-go
sudo mv -v /var/log/mysql/slow.log /var/log/mysql/slow.log.${now} && mysqladmin -uisuconp -pisuconp flush-logs
sudo mv -v /var/log/nginx/access.log /var/log/nginx/access.log.${now} && sudo systemctl reload nginx

