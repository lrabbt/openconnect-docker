# Openconnect with SSH Server #
	This image's idea is to connect to a VPN using Openconnect and access the conatiner using SSH.
## Environment Variables ##
* VPN_USER - Vpn user
* VPN_PWD - Vpn password
* VPN_GROUP - Vpn user group
* VPN_CERT - Server cetificate
* VPN_IP - Host IP

## Exposed Port ##
Port 22 - SSH Server port

## Usage Example ##
Export all variables and tunnel the SSH port:
```bash
docker run -d --name vpn \
	--privileged \
	-p 2222:22 \
	-e VPN_USER='best_admin' \
	-e VPN_PWD='supersecurepassword' \
	-e VPN_GROUP='my_group' \
	-e VPN_CERT='sha1:b8a490b3b85b0ec3a200f952eb6966765c1c1eda' \
	-e VPN_IP='https://192.168.0.56' \
	lrabbt/openconnect-ssh
```
