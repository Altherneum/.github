# Remoting
```
# Debian
dpkg --list | grep ssh                      # Liste les paquets SSH

# Sur Alma
rpm -qa | grep ssh                          # Liste les paquets SSH
ip a                                        # Liste les adresses IP (Inet = ip local net) # 10.20.222.86/24

# Debian & Alma
Systemctl status sshd                       # Vérifie si sshd est lancé ou stoppé

# Alma
ls -l /etc/ssh                              # Liste les fichiers SSH
more /etc/ssh/sshd_config                   # La configuration SSHD
useradd -m -s /bin/bash remotejeb           # Créer l'utilisateur remotejeb
useradd -m -s /bin/bash jebremote           # Créer l'utilisateur jebremote

# Debian
useradd -m -s /bin/bash remotejeb           # Créer l'utilisateur jebremote aussi sur debian
useradd -m -s /bin/bash jebremote           # Créer l'utilisateur remotejeb aussi sur debian

nano etc/sudoers                            # Liste des utilisateurs sudo
# Ajouter les logins dans la liste sudoers  # Configure les utilisateurs sudo

# Alma
nano /etc/hostname                          # Config hostname
# Ajouter "alma" dedans
reboot                                      # Si besoin car recharge pas tout seul
hostnamectl set-hostname          # ou      # systemctl restart systemd-hostnamed                    # à la place de reboot si vous souhaitez juste le recharger # A TESTER
passwd remotejeb                            # Change le mot de passe 
SuperRemote11                               # Taper le mot de passe suivant
passwd jebremote                            # Same here
SuperRemote11                               # Same password :3 ...

# Debian
ssh remotejeb@10.20.222.86                  # Lance une connection SSH
SuperRemote11                               # S'auth avec le compte remotejeb et son mot de passe
###################################################################################################

exit                                        # Quitter alma pour debian
nano /etc/hosts                             # Config des hôtes
# Ajouter la ligne # 10.20.222.86   alma    # Configure l'IP pour être résolue par "alma"

SSH remotejeb@alma                          # On peut du coup SSH sur Alma sans taper l'IP

SSH alma                                    # Va se connecter sur le compte reconnu en cours d'utilisation (si identique au système distant)

```

# Commandes SSH SFTP
```
# Sur debian
scp [FICHIER] remotejeb@alma:[PATH][FICHIER]  # Envoie le fichier vers alma dans le dossier
    scp test.txt remotejeb@alma:/home/remotejeb/test.txt

scp -r [PATH] [RemoteHost]/[PATH]             # SCP un dossier de manière récursive
scp -r Workspace 10.20.222.86/home/jeb        # Exemple

ssh [HOST] "[CMD]"                            # Lance une commande sans rester connecté
ssh 10.20.222.86 "ls -a"                      # Exemple

sftp [USER]@[HOST]                            # Mode SFTP (Voire cmd)
help                                          # Aide du mode sftp
get [REMOTEFILE] [LOCALFILE]                  # Télécharge le fichier
put [LOCALFILE] [REMOTEFILE]                  # Envoie le fichier
```

# Commande DF / DU
```
df -h                                         # Statistiques des fichiers et partitions
du                                            # Disk usage
```

# KeyGen RSA
```
ls -a /home/[USER]/.ssh/                      # Affiche le dossier des clés SSH

ssh-keygen -t rsa                             # Créer une clée RSA (Ne pas le faire en root pour la sécurité)
                                              # SuperPassPhrase123
ssh-keygen -t rsa -b
ssh-keygen -p -f [FILE]                       # Change la passphrase
ssh-copy-id [USER]@[HOST]                     # Copie la clée pour un hôte

ssh [USER]@[HOST]                             # Le mot de passe n'est plus demandé, uniquement la passphrase

ssh-agent                                     # Permet de créer un agent de mot de passe pour ne plus taper la passphrase
ssh-add                                       # Va demander la passPhrase pour la stocker à vie
ssh-add -d                                    # Supprime la clé de l'agent
ssh-add -l                                    # Affiche les clés de l'agent 
```

ssh-add -t 1h
