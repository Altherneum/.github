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

## Créer une clé SSH
### Créer la clé
- `ssh-keygen -t rsa -b 4096`
- Le serveur va répondre `Generating public/private rsa key pair.`
#### Choisir l'emplacement de stockage
- Une fois la clé crée, SSH va vous demander où la sauvegarder
  - Valider si le choix par défaut vous semble juste
- Si le choix par défaut n'est pas bon, rentrez le chemin voulu
  - Exemple : `/home/admin/.ssh/id_rsa`
#### Valider une passPhrase
- Une passphrase SSH est une **phrase secrète** ajoutée à une clé SSH pour ajouter une couche de sécurité supplémentaire
  - Elle est **requise chaque fois que la clé SSH est utilisée**, empêchant ainsi quiconque ayant accès à l'ordinateur sur lequel sont stockées les clés privées d'accéder aux systèmes utilisant cette clé
```
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```
- Exemple : `ABCStrongPassword!`
#### Résultat de la clé SSH
```
Your identification has been saved in /home/admin/.ssh/id_rsa_test
Your public key has been saved in /home/admin/.ssh/id_rsa_test.pub

The key fingerprint is:
SHA256:A/AAAAAAAAAAAAAAAAAAAAA/AAAAAAAAAAAAAAAAAAA root@vps

The key's randomart image is:
+---[RSA 4096]----+
|                 |
|       ABC       |
|       ABC       |
|       ABC       |
|       ABC       |
|       ABC       |
|       ABC       |
|       ABC       |
|                 |
+----[SHA256]-----+
```

### Transférer la clé sur le serveur
- Si vous avez crée la clée sur votre PC et non pas sur le serveur
- `scp C:/Users/<username>/.ssh/<id_rsa_file_name>.pub admin@altherneum.fr:/home/<username>/.ssh/<id_rsa_file_name>.pub`
  - Exemple du cours : `scp C:/Users/user/.ssh/id_rsa.pub admin@altherneum.fr:/home/admin/.ssh/id_rsa.pub`

### Déplacer la clé .pub dans les authorized_keys
Afin de permettre au serveur de lire la clé publique, et donc de confirmer notre clé privé lors de la connexion, il faut la déplacer dans la clé publique de l'utilisateur dans son profil sur le Serveur :
- `cat /home/<username>/.ssh/<id_rsa_file_name>.pub >> /home/<username>/.ssh/authorized_keys`
  - Exemple du cours `cat /home/admin/.ssh/id_rsa.pub >> /home/admin/.ssh/authorized_keys`

### Extraire la clé privé
Si vous avez crée la clé sur le serveur et non pas sur votre machine
- Copier la clé `.pub` vers votre machine
- Exemple : `scp user@server:/home/<user>/.ssh/id_rsa C:\Users\<username>\.ssh\<id_rsa_key_name>`
  - Exemple du cours : `scp admin@altherneum.fr:/home/admin/.ssh/id_rsa C:\Users\user\.ssh\id_rsa`

#### Résultat de l'extraction de la clé
```
admin@altherneum.fr's password:
id_rsa.pub           100%  760     8.7KB/s   00:00
```

### Tester la clé
- `ssh -i ~/.ssh/[KEY_NAME] root@[HOST]`
### Bloquer les connections sans clé
- `PermitRootLogin without-password`
- `PasswordAuthentication no`
- `service ssh restart`
- `service sshd restart`

### Valider la clé
- `ssh admin@root`
```
PS C:\Users\user> ssh admin@altherneum.fr
Enter passphrase for key 'C:\Users\user/.ssh/id_rsa':
```
- Valider avec la passPhrase

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