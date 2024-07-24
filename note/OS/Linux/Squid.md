# Squid
## Install
- `apt install squid`
- `/etc/squid/squid.conf`
## Backup
- `sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.original` Copie du fichier pour une backup
- `sudo chmod a-w /etc/squid/squid.conf.original` Retrait du droit d'écriture
## Créer une configuration
- `touch /etc/squid/squid.conf`
- `nano /etc/squid/squid.conf`
## Configurer le fichier
```
http_port 3128
```
## Black list
- `touch /etc/squid/[FILE]` Créer le fichier
- `nano /etc/squid/[FILE]` Modifier le fichier et y ajouter des sites :
```
.youtube.com
.youtube.fr
.amazon.com
.amazon.fr
.facebook.com
```
- `acl [ACL_NAME] dstdomain "/etc/squid/[FILE]"`
- `http_access deny [ACL_NAME]`
### Black list all
- `touch /etc/squid/[FILE]` Créer le fichier
- `nano /etc/squid/[FILE]` Modifier le fichier et y ajouter des sites :
```
.github.com
```
- `acl allowed_website dstdomain "/etc/squid/[FILE]"`
- `http_access allow allowed_website`
- `http_access deny all`

## Relancer
- `sudo squid -k reconfigure`
## Restart
- `sudo systemctl restart squid`
## Enable
- `sudo systemctl enable squid`
## Disable
- `sudo systemctl disable squid`