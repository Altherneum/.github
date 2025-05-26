# MOTD
**Message Of The Day**, abrégé **MOTD** en français : « **message du jour** » est un message envoyé à un logiciel client lors de son identification sur des serveurs (tels que les serveurs IRC, SSH ou encore FTP ou même un jeu vidéo)

Généralement, ce message est utilisé pour afficher les règles, les contacts administratifs, ou encore un dessin ASCII Art

## MOTD Ubuntu
`/etc/update-motd.d/`
### Retirer le MOTD Ubuntu par défaut
#### Désactiver les scripts MOTD d'Ubuntu
- `sudo chmod -x /etc/update-motd.d/*` Permet de supprimer les autorisations d'exécution des scripts dans le répertoire `/etc/update-motd.d/`
#### Déplacer les scripts MOTD d'Ubuntu
- `sudo mv /etc/update-motd.d/* /etc/update-motd.d/backup/` Permet de déplacer les scripts dans le répertoire `/etc/update-motd.d/backup/`
### Créer votre MOTD Ubuntu
- `touch /etc/update-motd.d/01-altherneum` Créer le fichier `01-altherneum`
- `chmod +x /etc/update-motd.d/01-altherneum` Rend le fichier exécutable
- `nano /etc/update-motd.d/01-altherneum` Ajoutez dans le fichier vos commandes
#### Exemple de MOTD Ubuntu
- [01-altherneum](https://github.com/Altherneum/server/blob/main/etc/update-motd.d/01-altherneum) est le script lancé en tant que MOTD
- [setup.system.motd.sh](https://github.com/Altherneum/server/blob/main/scripts/sh/setup.system.motd.sh) est le script installant le MOTD personnalisé et retirant celui par défaut d'Ubuntu

## MOTD Linux
`/etc/motd` est le MOTD statique de Linux. Il est lancé après une connexion réussie mais juste avant exécute le shell de connexion
### Supprimer le MOTD Linux
`sudo rm /etc/motd` Permet de supprimer le MOTD
### Vider le MOTD Linux
`echo "" > /etc/motd` Remplace le fichier `/etc/motd` par un fichier vide
### Remplacer le MOTD Linux
- `echo "Text" > /etc/motd` Remplace le fichier `/etc/motd` par un fichier contenant une ligne indiqué (Exemple : `"Text"`)
- `echo "Text 2" >> /etc/motd` Ajoute dans le fichier `/etc/motd` la ligne indiqué