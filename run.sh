#!/bin/bash

/etc/init.d/ssh restart

echo $VPN_PWD | openconnect -u "$VPN_USER" --passwd-on-stdin --authgroup="$VPN_GROUP" --servercert="$VPN_CERT" $VPN_IP

exec "$@"