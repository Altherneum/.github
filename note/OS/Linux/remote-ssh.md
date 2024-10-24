# SSH
## Vérifier le status de SSHD
- `Systemctl status sshd`

## Fichier de configuration SSH
- `ls -l /etc/ssh`
- `more /etc/ssh/sshd_config` Fichier de configuration original [doc](https://www.delafond.org/traducmanfr/man/man5/sshd_config.5.html)
- `nano /etc/ssh/sshd_config.d/*.conf` Fichier de configuration à modifier
  - `PermitRootLogin` Spécifie si root peut se connecter par ssh
  - `PasswordAuthentication` Spécifie si l'authentification par mot de passe est autorisée
  - `AllowUsers` Ce mot-clef peut être suivi d'une liste de noms d'utilisateurs. S'il est spécifié, seuls les noms d'utilisateurs correspondant sont autorisés à se connecter
  - `AuthorizedKeysFile` Spécifie le fichier contenant les clefs publiques à utiliser pour l'authentification de l'utilisateur
  - `PubkeyAuthentication` Spécifie si on autorise l'authentification par clef publique
### Afficher la configuration
- `sudo sshd -T`

## Vérifier les logs
- `var/log/auth.log` ou `/var/log/secure`

## Créer une clé
- `ssh-keygen -f [KEY_NAME]`
### Transférer la clé sur le serveur
`ssh-copy-id -i ~/.ssh/[KEY_NAME] root@[HOST]`
### Tester la clé
- `ssh -i ~/.ssh/[KEY_NAME] root@[HOST]`
### Bloquer les connections sans clé
- `PermitRootLogin without-password`
- `PasswordAuthentication no`
- `service ssh restart`
- `service sshd restart`

## Se connecter
### Se connecter en SSH
- `ssh [USER]@[HOST]`
  - `ssh root@altherneum.fr`
### Envoyer une commande et se déconnecter
- `ssh [HOST] "[CMD]"` Lance une commande sans rester connecté
- `ssh 10.20.222.86 "ls -a"` Exemple
### Se connecter en SFTP
### Envoyer ou télécharger des fichiers
- `scp [FICHIER] [USER]@[HOST]:[PATH][FICHIER]` Envoie le fichier vers l'host
  - `scp test.txt superusername@altherneum.fr:/home/superusername/test.txt`
- `scp -r [PATH] [RemoteHost]/[PATH]` SCP un dossier de manière récursive
  - `scp -r Workspace altherneum.fr/home/superusername` Exemple