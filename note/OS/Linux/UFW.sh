apt install ufw
sudo ufw enable

sudo ufw default deny incoming
sudo ufw default deny outgoing

# List
# https://fr.wikipedia.org/wiki/Liste_de_ports_logiciels
# https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers

# SSH (22)
sudo ufw allow in ssh
sudo ufw allow out ssh

# HTTP (80)
sudo ufw allow in http
sudo ufw allow out http
# HTTPS (443)
sudo ufw allow in https
sudo ufw allow out https

# DNS (53)
sudo ufw allow in dns
sudo ufw allow out dns

# Echo (7) # /etc/ufw/before.rules configuration file
## Allow echo out
echo "-A ufw-before-output -p icmp --icmp-type echo-request -j ACCEPT" >> /etc/ufw/before.rules

# Time protocol (37)
# DHCP (67/68 ?)
# SFTP (22)
# FTP? (20/21) Disallow, use SFTP
# NetBIOS (137/138/139)

# Reload
sudo ufw reload

# Show verbose
sudo ufw verbose