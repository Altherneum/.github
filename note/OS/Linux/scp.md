# SCP
La commande SCP (**Secure Copy Protocol**) sous Linux est utilisée pour les transferts de fichiers sécurisés entre un hôte local et un hôte distant ou entre deux hôtes distants utilisant le protocole SSH pour l'authentification et le cryptage
## Envoyer ou télécharger des fichiers
- `scp [FICHIER] [USER]@[HOST]:[PATH][FICHIER]` Envoie le fichier vers l'host
  - `scp test.txt superusername@altherneum.fr:/home/superusername/test.txt`
- `scp -r [PATH] [RemoteHost]/[PATH]` SCP un dossier de manière récursive
  - `scp -r Workspace altherneum.fr/home/superusername` Exemple