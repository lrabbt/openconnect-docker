#!/bin/bash

/etc/init.d/ssh restart

if [ "$SSH_PWD" != '' ]; then
	echo "Setting SSH Password"
	echo "root:$SSH_PWD" | chpasswd
fi

echo "Connecting to VPN"
if [ "$DETACHED" = 'TRUE' ]; then
	echo $VPN_PWD | openconnect -u "$VPN_USER" --passwd-on-stdin --authgroup="$VPN_GROUP" --servercert="$VPN_CERT" $VPN_IP
else
	echo $VPN_PWD | openconnect -u "$VPN_USER" --passwd-on-stdin --authgroup="$VPN_GROUP" --servercert="$VPN_CERT" $VPN_IP &
	exec /bin/bash
fi