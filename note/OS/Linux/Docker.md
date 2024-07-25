# Docker

## Installer
## Vérifier la version
- `docker version`

## Pull image
- `docker pull [NOM]`
  - `docker pull nginx`
  - `docker pull httpd:2.4`
    - `:2.4` Permet de spécifier la version
  - `docker pull openjdk`

## Lister les images
- `docker images`

## Remove image
- `docker image rm [OPTIONS] [IMAGE...]`
  - `-f`, `--force` Force removal of the image
  - `--no-prune` Do not delete untagged parents
- `docker image remove [IMAGE...]`
- `docker rmi [IMAGE]`
### Remove image rmi
- `docker rmi [IMAGE]`
  - `docker rmi openjdk`
### Remove image version
- `docker rmi [IMAGE]:[VERSION]`
  - `docker rmi [IMAGE]:latest` Supprime la dernière version
  - `docker rmi httpd:2.4` Permet de supprimer une version
### Remove image par ID
- `docker rmi [ID]`
  - `docker rmi fd484f19954f` Supprimer une image par son ID (court ou long)
### Remove images
- `docker image remove [IMAGE1] [IMAGE2] [...]`
### Supprimer des images pruned
- `docker image prune` Supprime les images non référencés

## Inspecter une image
- `docker inspect [IMAGE]` Permet d'inspecter les images docker
  - `docker inspect httpd`
  - `docker inspect fd484f19954f` Inspecter le conteneur par son ID court
  - `docker inspect 69472fe17a116207aac52e6b782960e307b37d235bb418d3a43f63f5edf050a9` Inspecter le conteneur par son ID long
## Inspecter une image avec des détails
- `docker inspect --format="{{[SETTINGS]}}" [NOM]`
  - `docker inspect --format="{{.NetworkSettings}}" serveur1`
- `docker inspect --format="{{[SETTINGS].[SETTINGS2].[...]}}" [NOM]`
  - `docker inspect --format="{{.NetworkSettings.IPAddress}}" serveur1`


## Lancer une image
- `docker run [IMAGE]` L'image va être téléchargé si elle n'existe pas, puis lancée
  - `docker run nginx`
- `docker run -d [IMAGE]` Lance l'image en mode deamon / détaché
  - `docker run -d nginx`
- `docker run -it [IMAGE]` Lance l'image de manière interactive (Avec son shell root)
  - `docker run -it centos`
  - `-it` is short for `--interactive` + `--tty`
  - `-d` is short for `--detach`
  - `-itd`

## Lancer et renomer une image
- `docker run --name [NOM] -d [IMAGE]`
  - `docker run --name Serveur1 -d nginx`
  - `docker run -d --name Serveur1 nginx`

## Renommer un conteneur
- `docker rename [OLD_NAME] [NOM]`
  - `docker rename sweet_wozniak serveur1`

## Lancer un conteneur
- `docker start [NOM]`
  - `docker start serveur1`

## Lancer une commande dans un conteneur
- `docker exec [NOM] [CMD]`
  - `docker exec serveur1 ls /usr/local/`
  - `docker exec serveur1 printenv`

## Se connecter au terminal du conteneur
- `docker exec -it [NOM] bash`
  - `docker exec -it serveur1 bash`
- `exit` pour quitter le shell

## Envoyer un fichier au conteneur
- `docker cp [FILE] [NOM]:[PATH]`
  - `docker cp C:/Users/Administrateur/Documents/file.txt serveur1:/usr/local`

## Télécharger un fichier du conteneur
- `docker cp [NOM]:[FILE] [PATH]`
  - `docker cp serveur1:/usr/local/text.txt C:/Users/Administrateur/Documents`
  - `docker cp serveur1:/usr/local/text.txt .` Le `.` Permet de préciser le dossier actuel (là où la console est actuellement)

## Stoper un conteneur
- `docker stop [NOM]`
  - `docker stop Serveur1`

## Supprimer un conteneur
- `docker rm [NOM]` Supprime un conteneur
  - `docker rm serveur1`
- `docker rm -f [NOM]` Supprime de force un conteneur
  - `docker rm -f serveur1`

## Supprimer des conteneurs pruned
- `docker conteneur prune` Supprime les conteneurs non référencés, stopés, réseau non utilisés, cache, ...

## Lister les conteneurs
- `docker ps` Liste les conteneurs
  - `docker ps -a` Liste tout les conteneurs même ceux failed ou exited

## Supprimer les pruned
- `docker system prune -a`

## Vérifier le stockage
- `docker system df`

## Logs conteneur
- `docker logs [NOM]`
