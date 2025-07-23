# SSH
**Secure Shell** (SSH) est un protocole de communication sécurisé
- Le protocole de connexion impose un échange de clés de chiffrement en début de connexion
- Par la suite, tous les segments TCP sont authentifiés et chiffrés
  - Il devient donc impossible d'utiliser un analyseur de paquets (sniffer) pour voir ce que fait l'utilisateur

Le protocole SSH a été conçu avec l'objectif de remplacer les différents protocoles non chiffrés comme rlogin, telnet, rcp et rsh

## Image SSH avec un MOTD
![Image de connexion SSH avec un MOTD](https://github.com/Altherneum/.github/blob/main/note/assets/images/WindowsTerminal_C6L2YhXPMX.png?raw=true)

## SSH vs SSHD
- **SSH**: Outil côté **__client__** pour initier des connexions
- **SSHD**: Daemon côté **__serveur__** pour accepter et gérer les connexions

## Vérifier le status de SSHD
### Vérifier le status de SSHD via systemCTL
- `Systemctl status sshd` ou `Systemctl status ssh`
### Vérifier la configuration de SSHD
Pour vérifier la configuration du serveur sshd, vous pouvez utiliser la commande `sshd -T`

- Cela vous permet de voir les paramètres actuellement appliqués, y compris les valeurs par défaut et les remplacements du fichier de configuration
- Cette commande affiche les paramètres de configuration complets dans l'ordre dans lequel ils sont traités par sshd
- Si vous devez vérifier la syntaxe du fichier de configuration avant d'appliquer des modifications, vous pouvez utiliser l'option `-t` à la place
  - Cela vérifie la validité du fichier de configuration et la santé des clés, en veillant à ce qu'il n'y ait pas d'erreurs de syntaxe

## Fichier de configuration SSHD
- `ls -l /etc/ssh`
- `more /etc/ssh/sshd_config` Fichier de configuration original [doc](https://www.delafond.org/traducmanfr/man/man5/sshd_config.5.html)
- `nano /etc/ssh/sshd_config.d/*.conf` Fichier de configuration à modifier
  - `PermitRootLogin` Spécifie si root peut se connecter par ssh
  - `PasswordAuthentication` Spécifie si l'authentification par mot de passe est autorisée
  - `AllowUsers` Ce mot-clef peut être suivi d'une liste de noms d'utilisateurs. S'il est spécifié, seuls les noms d'utilisateurs correspondant sont autorisés à se connecter
  - `AuthorizedKeysFile` Spécifie le fichier contenant les clefs publiques à utiliser pour l'authentification de l'utilisateur
  - `PubkeyAuthentication` Spécifie si on autorise l'authentification par clef publique
### Fichier de configuration custom
#### Comment créer un fichier de configuration SSH
- Créer un fichier `<NOM>.conf` dans `/etc/ssh/sshd_config.d/`
- Ajouter dans le fichier les règles SSH
  - Exemple :
```
PermitRootLogin no
permitemptypasswords no
PubkeyAuthentication yes
```
- Relancer SSHD : `systemctl restart sshd`
#### En script
```
touch /etc/ssh/sshd_config.d/hardening.conf

echo "PermitRootLogin no" >> /etc/ssh/sshd_config.d/hardening.conf
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config.d/hardening.conf
# echo "PasswordAuthentication no" >> /etc/ssh/sshd_config.d/hardening.conf # Créer une clef SSH avant d'activer
echo "permitemptypasswords no" >> /etc/ssh/sshd_config.d/hardening.conf

systemctl restart sshd
```
### Relancer SSH
#### Via SystemCTL
- `Systemctl restart ssh`

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
Vérifier si la commande est OK : à tester : TO DO !
- `ssh -i ~/.ssh/[KEY_NAME] root@[HOST]`

### Bloquer les connections sans clé
- Voire la chapitre [# Fichier de configuration SSH](#Fichier-de-configuration-SSH)

### Valider la clé
- `ssh admin@root`
```
PS C:\Users\user> ssh admin@altherneum.fr
Enter passphrase for key 'C:\Users\user/.ssh/id_rsa':
```
- Valider avec la passPhrase

### Ajouter la clé privé sur Windows
- Lancer SSH en administrateur : `Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service`
- Ajouter la clé privé : `ssh-add "C:\Users\<username>\.ssh\<id_rsa_key_name>"`
  - Exemple du cours : `ssh-add "C:\Users\user\.ssh\id_rsa"`
- Valider avec la passPhrase
#### Résultat de l'ajout de la clé privé sur Windows
```
ssh-add "C:\Users\user\.ssh\id_rsa"
Enter passphrase for C:\Users\user\.ssh\id_rsa:
Identity added: C:\Users\user\.ssh\id_rsa (admin@vps)
```

Et lors de la connexion :
```
ssh admin@altherneum.fr
🐧      OS              GNU/Linux
...
```

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
#### etc/ssh/sshrc
- `/etc/ssh/sshrc`
  - Créer le fichier et y ajouter des commandes
  - Ce fichier et exécuté avant de finaliser la connection SSH
  - Exemple de script : [Discord WebHook on SSH connection](https://github.com/Altherneum/server/blob/main/etc/ssh/sshrc)
### Connexions SSH log par SystemD
- `journalctl`
  - `journalctl _SYSTEMD_UNIT=sshd.service`
  - `journalctl _SYSTEMD_UNIT=sshd.service | grep "Failed"`
