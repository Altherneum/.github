# Arch auto installation script
## install.sh
### Keyboard
- `loadkeys fr` pour charger un clavier `AZERTY`
  - Ce qui donne avec un clavier `QWERTY` : `loqdkeys fr`
### Downloading script
```
curl -o /arch.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/arch.sh
chmod +x /arch.sh
```
### Modifier les variables
- Utilisateur, mot de passe, nom d'hôte, ...
- Pour modifier le fichier, utilisez `nano`, `vim`, etc...
  - Exemple : `nano /arch.sh`
  - Pour sauvegarder via `nano` : `CTRL` + `X`
    - Puis `Y`/`N` pour choisir de sauvegarder ou quitter
    - Puis valider le nom si vous sauvegardez le fichier

## Lancer l'installation
### Lancer l'installation sans logs
`/arch.sh` Vous verrez ce que fait l'ordinateur en fond, mais vous ne pourrez pas vous déplacer dans les logs
### Lancer l'installation avec envoie des logs
`/arch.sh 2>&1 | curl -F 'file=@-' 0x0.st` Vous ne verrez pas ce que l'ordinateur fait en fond, vous n'aurez qu'un lien à la fin de l'installation vers des logs en ligne
- Le lien contenant les logs sera semblable à [https://0x0.st/ABCD.txt](https://0x0.st)

## Start Arch
### Remove ISO
Retirer l'ISO ou CD/DVD du lecteur (Virtuel comme physique)
## Login
Lancer le compte par défaut `Arch` avec comme mot de passe `UserPass123`
