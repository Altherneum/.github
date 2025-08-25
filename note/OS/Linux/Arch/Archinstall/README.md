# Arch auto installation script
## install.sh
### Keyboard
- `loadkeys fr` pour charger un clavier `AZERTY`
  - Ce qui donne avec un clavier `QWERTY` : `loqdkeys fr`
### Downloading script
```
curl -o /arch.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archinstall/arch.sh
chmod +x /arch.sh
```
### Modifier les variables
- Utilisateur, mot de passe, nom d'hôte, ...
- Pour modifier le fichier, utilisez `nano`, `vim`, etc...
  - Exemple : `nano /arch.sh`
  - Pour sauvegarder : `CTRL` + `X`, `Y`/`N` pour choisir de sauvegarder ou quitter, puis valider le nom si vous sauvegardez le fichier.
### Lancer l'installation
`/arch.sh 2>&1 | curl -F 'file=@-' 0x0.st`

## Start Arch
### Remove ISO
Retirer l'ISO ou CD/DVD du lecteur (Virtuel comme physique)
## Login
