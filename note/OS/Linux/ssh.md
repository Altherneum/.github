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

## Vérifier les dernières connexions SSH
### Connexions SSH échouées
`lastb`
### Connexions SSH réussies
`last`
### Connexions SSH depuis un fichier
#### Auth.log
- `/var/log/auth.log`
  - `grep "Failed password" /var/log/auth.log`
#### var/log/secure
- `/var/log/secure`
  - `grep "Failed password" /var/log/secure`
#### var/log/btmp
- `/var/log/btmp` est le fichier sous Linux est utilisé pour stocker des informations sur les tentatives de connexion infructueuses.
Il s'agit d'un fichier binaire qui enregistre chaque tentative de connexion infructueuse effectuée sur le système
  - `last /var/log/btmp` Affiche la première connexion enregistré
  - `last -f /var/log/btmp` Affiche le fichier 
### Connexions SSH log par SystemD
- `journalctl`
  - `journalctl _SYSTEMD_UNIT=sshd.service`
  - `journalctl _SYSTEMD_UNIT=sshd.service | grep "Failed"`

## Vérifier la configuration SSHD
Pour vérifier la configuration du serveur sshd, vous pouvez utiliser la commande `sshd -T`

- Cela vous permet de voir les paramètres actuellement appliqués, y compris les valeurs par défaut et les remplacements du fichier de configuration
- Cette commande affiche les paramètres de configuration complets dans l'ordre dans lequel ils sont traités par sshd
- Si vous devez vérifier la syntaxe du fichier de configuration avant d'appliquer des modifications, vous pouvez utiliser l'option `-t` à la place
  - Cela vérifie la validité du fichier de configuration et la santé des clés, en veillant à ce qu'il n'y ait pas d'erreurs de syntaxe