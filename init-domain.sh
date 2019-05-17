#!/bin/bash

DOMAIN=$1
EMAIL=$2
FNAME="$DOMAIN.conf"
CUR=$PWD

cd data/nginx/

echo "server {" > $FNAME
echo "    listen 80;" >> $FNAME
echo "    server_name $DOMAIN;" >> $FNAME
echo "    server_tokens off;" >> $FNAME
echo "" >> $FNAME
echo "    root /usr/share/nginx/html;" >> $FNAME
echo "" >> $FNAME
echo "    location /.well-known/acme-challenge/ {" >> $FNAME
echo "        root /var/www/certbot;" >> $FNAME
echo "    }" >> $FNAME
echo "}" >> $FNAME

cd $CUR

./stop.sh

./init-letsencrypt.sh $DOMAIN $EMAIL

cd data/nginx/

echo "server {" > $FNAME
echo "    listen   80;" >> $FNAME
echo "    listen   [::]:80;" >> $FNAME
echo "    listen   443 ssl;" >> $FNAME
echo "" >> $FNAME
echo "    server_name $DOMAIN www.$DOMAIN;" >> $FNAME
echo "" >> $FNAME
echo "    ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;" >> $FNAME
echo "    ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;" >> $FNAME
echo "    include /etc/letsencrypt/options-ssl-nginx.conf;" >> $FNAME
echo "    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;" >> $FNAME
echo "" >> $FNAME
echo "    if ($scheme = http) {" >> $FNAME
echo "        return 301 https://\$server_name\$request_uri;" >> $FNAME
echo "    }" >> $FNAME
echo "" >> $FNAME
echo "    root /usr/share/nginx/html;" >> $FNAME
echo "" >> $FNAME
echo "    \#location / {" >> $FNAME
echo "    \#    proxy_pass http://localhost:80; \#PROXY DESTINATION" >> $FNAME
echo "    \#    proxy_set_header    Host                \$http_host;" >> $FNAME
echo "    \#    proxy_set_header    X-Real-IP           \$remote_addr;" >> $FNAME
echo "    \#    proxy_set_header    X-Forwarded-For     \$proxy_add_x_forwarded_for;" >> $FNAME
echo "    \#}" >> $FNAME
echo "}" >> $FNAME

cd $CUR

./stop.sh

echo "DONE."
