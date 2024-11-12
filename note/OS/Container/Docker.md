# Docker
- [docker.com](https://www.docker.com/)
- [docker.com / products/docker-desktop](https://www.docker.com/products/docker-desktop/)
- [docs.docker.com / get-docker](https://docs.docker.com/get-docker/)
- [docs.docker.com](https://docs.docker.com/)
- [hub.docker.com](https://hub.docker.com/)

![Docker image explication](https://github.com/Altherneum/.github/blob/main/note/assets/images/Container_Evolution.svg?raw=true)

## Installer
## Vérifier la version
- `docker version`

## Images
### Pull image
- `docker pull [IMAGE]`
  - `docker pull nginx`
  - `docker pull httpd:2.4`
    - `:2.4` Permet de spécifier la version
  - `docker pull openjdk`
### Lister les images
- `docker images`
### Remove image
- `docker image rm [OPTIONS] [IMAGE...]`
  - `-f`, `--force` Force removal of the image
  - `--no-prune` Do not delete untagged parents
- `docker image remove [IMAGE...]`
- `docker rmi [IMAGE]`
#### Remove image rmi
- `docker rmi [IMAGE]`
  - `docker rmi openjdk`
#### Remove image version
- `docker rmi [IMAGE]:[VERSION]`
  - `docker rmi [IMAGE]:latest` Supprime la dernière version
  - `docker rmi httpd:2.4` Permet de supprimer une version
#### Remove image par ID
- `docker rmi [ID]`
  - `docker rmi fd484f19954f` Supprimer une image par son ID (court ou long)
#### Remove images
- `docker image remove [IMAGE1] [IMAGE2] [...]`
#### Supprimer des images pruned
- `docker image prune` Supprime les images non référencés
### Inspecter une image
- `docker inspect [IMAGE]` Permet d'inspecter les images docker
  - `docker inspect httpd`
  - `docker inspect fd484f19954f` Inspecter le conteneur par son ID court
  - `docker inspect 69472fe17a116207aac52e6b782960e307b37d235bb418d3a43f63f5edf050a9` Inspecter le conteneur par son ID long

## Inspecter une image/conteneur avec des détails
- `docker inspect --format="{{[SETTINGS]}}" [IMAGE|CONTENEUR]`
  - `docker inspect --format="{{.NetworkSettings}}" serveur1`
- `docker inspect --format="{{[SETTINGS].[SETTINGS2].[...]}}" [IMAGE|CONTENEUR]`
  - `docker inspect --format="{{.NetworkSettings.IPAddress}}" serveur1`
  - `docker inspect --format="{{.NetworkSettings.Networks.bridge.IPAddress}}" serveur1`

## Créer un conteneur
### Lancer une image
- `docker run [IMAGE]` L'image va être téléchargé si elle n'existe pas, puis lancée
  - `docker run nginx`
- `docker run -d [IMAGE]` Lance l'image en mode deamon / détaché
  - `docker run -d nginx`
- `docker run -it [IMAGE]` Lance l'image de manière interactive (Avec son shell root)
  - `docker run -it centos`
  - `-it` is short for `--interactive` + `--tty`
  - `-d` is short for `--detach`
  - `-itd`

### Renommer un conteneur
- `docker rename [CONTENEUR] [NOM]`
  - `docker rename sweet_wozniak serveur1`

### Lancer et renomer une image
- `docker run --name [NOM] -d [IMAGE]`
  - `docker run --name Serveur1 -d nginx`
  - `docker run -d --name Serveur1 nginx`

### Lancer un conteneur
- `docker start [CONTENEUR]`
  - `docker start serveur1`

## Utiliser un conteneur
### Lancer une commande dans un conteneur
- `docker exec [CONTENEUR] [CMD]`
  - `docker exec serveur1 ls /usr/local/`
  - `docker exec serveur1 printenv`

### Se connecter au terminal du conteneur
- `docker exec -it [CONTENEUR] bash`
  - `docker exec -it serveur1 bash`
- `exit` pour quitter le shell

### Envoyer un fichier au conteneur
- `docker cp [FILE] [CONTENEUR]:[PATH]`
  - `docker cp C:/Users/Administrateur/Documents/file.txt serveur1:/usr/local`

### Télécharger un fichier du conteneur
- `docker cp [CONTENEUR]:[FILE] [PATH]`
  - `docker cp serveur1:/usr/local/text.txt C:/Users/Administrateur/Documents`
  - `docker cp serveur1:/usr/local/text.txt .` Le `.` Permet de préciser le dossier actuel (là où la console est actuellement)

## Gérer un conteneur
### Stoper un conteneur
- `docker stop [CONTENEUR]`
  - `docker stop Serveur1`

### Supprimer un conteneur
- `docker rm [CONTENEUR]` Supprime un conteneur
  - `docker rm serveur1`
- `docker rm -f [CONTENEUR]` Supprime de force un conteneur
  - `docker rm -f serveur1`

### Supprimer des conteneurs pruned
- `docker conteneur prune` Supprime les conteneurs non référencés, stopés, réseau non utilisés, cache, ...

## Nettoyer Docker
### Lister les conteneurs
- `docker ps` Liste les conteneurs
  - `docker ps -a` Liste tout les conteneurs même ceux failed ou exited

### Supprimer les pruned
- `docker system prune -a`

### Vérifier le stockage
- `docker system df`

### Logs conteneur
- `docker logs [CONTENEUR]`

## Ajouter une variable à un conteneur
- `docker run --env [NOM]=[VARIABLE] [CONTENEUR]` Permet d'ajouter des variables
- `docker run --env [NOM]=[VARIABLE] --e [NOM]=[VARIABLE] [CONTENEUR]` `--e` Permet d'ajouter d'autres variables
  - `docker run --env OWNER="ABC"`

- `docker exec [CONTENEUR] export [NOM_VARIABLE]=[VARIABLE]` Permet d'ajouter des variables avec le shell linux

- `docker exec [CONTENEUR] printenv` Afficher les variables

## Volumes
Les volumes rendent persistant les données
### Créer des volumes
- `docker volume create [VOLUME]`
  - `docker volume create my-volume`
### Inspecter des volumes
- `docker volume inspect [VOLUME]`
  - `docker volume inspect my-volume`
### Lister les volumes
- `docker volume ls`
### Supprimer des volumes
- `docker volume rm [VOLUME]`
### Monter un volume
- `docker run -d --name [NOM] --volume [VOLUME]:[MOUNTING_PATH] [IMAGE]`
### Partager un dossier
- `docker run -d --name [NOM] --volume [PATH]:[MOUNTING_PATH] [IMAGE]`
  - `docker run -d --name bind-vol-container --volume /tmp/m2i:/mnt/volumes/testvolume httpd` Partage un dossier linux
- `docker run -d --name [NOM] --volume "[PATH]":[MOUNTING_PATH] [IMAGE]`
  - `docker run -d --name test-vol-bind --volume "C:/Docker-Files":/mnt/volumes httpd` Partage un dossier Windows

## Ouvrir des ports
### Ouvrir les ports via -p
- `docker run -d --name [NOM] -p [PORT_MACHINE]:[PORT_CONTAINER] [IMAGE]`
  - `docker run -d --name httpd01 -p 8080:80 httpd`
- `docker run -d --name [NOM] --publish [PORT_MACHINE]:[PORT_CONTAINER] [IMAGE]:[VERSION]`
  - `docker run -d --name nginx -p 80:80 nginx:latest`
- `docker run -d --name [NOM] -P [IMAGE]` Ouvre tout les ports du conteneur
  - `docker run -d --name [NOM] --publish-all [IMAGE]`
### Ouvrir des ports via --expose
- `docker run -d --name [NOM] --expose [PORT] [IMAGE]`
- `docker run -d --name [NOM] --expose [PORT] [IMAGE]:[VERSION]`
  - `docker run -d --name demo-run --expose 443 demo-image:latest`
### Tester les ports HTTP(S)
- `curl localhost:8080`

## Réseau
### Types de réseaux
- `Bridge`
  - Le conteneur aura sa propre IP
- `Host`
  - Un seul réseau `host` possible
  - Le conteneur aura l'IP de l'hôte
- `null`
  - Un seul réseau `null` possible
  - Le conteneur n'aura pas de réseau
### Lister les réseaux
- `docker network ls`
### Inspecter un réseau
- `docker network inspect [NETWORK]`
  - `docker network inspect bridge`
### Créer des réseaux
- `docker network create [NOM]`
  - `docker network create test-network`
- `docker network create [NOM] --driver [DRIVER]`
  - `docker network create test-network --driver bridge`
- `docker network create --driver [DRIVER] --gateway=[IP] --subnet=[IP]/[CIDR] [NOM]`
  - `docker network create --driver bridge --gateway=10.20.222.254 --subnet=10.20.222.0/24 test-net`
### Supprimer des réseaux
- `docker network rm [NETWORK]`
  - `docker network rm test-network`
### Lancer une image sur un réseau
- `docker run -d --name [NOM] --network [NETWORK] [IMAGE]`
  - `docker run -d --name Apache-Host-Net --network host httpd`
- `docker run -d --name [NOM] -p [PORT_MACHINE]:[PORT_CONTAINER] --network [NETWORK] [IMAGE]`
  - `docker run -d --name Apache-Host-Net -p 8080:80 --network host httpd`
- `docker run -d --name [NOM] -p [PORT_MACHINE]:[PORT_CONTAINER] --ip [IP] --network [NETWORK] [IMAGE]`
  - `docker run -d --name test-bridge-ip -p 8080:80 --ip 10.20.222.110 --network test-net httpd`

## Docker build
### Contenu du dossier
- Le dockerfile (`app1/dockerfile`)
- L'application à exporter (Exemple une page HTML) (`app1/myapp.html`)
### Docker file
```
FROM [IMAGE]:[VERSION]
RUN mkdir -p [PATH]
WORKDIR [PATH]
EXPOSE [PORT]

RUN mkdir -p /Docker/appABC
WORKDIR /Docker/appABC
```

```
FROM ubuntu:jammy
RUN apt update
RUN apt install -y nginx
COPY myapp.html /var/www/html/index.html
EXPOSE 8080
EXPOSE 80
```
### Build un Docker file
- `docker build [PATH] -t [NOM]:[VERSION]`
  - `docker build C:/app1 -t image-test:latest` Préciser le nom du dossier contenant le dockerfile
  - `docker build . -t image-test:latest` Le `.` si la console est déjà placée dans le bon dossier
### Lancer l'image du build
- `docker run -d --name test-build -p 1234:80 test-image-build:latest`
### Uploader l'image sur Dockerhub
- `docker tag [IMAGE]:[VERSION] [USER]/[REPOSITORY]:[VERSION]` Applique un tag de version à l'image au nom du compte et du repository
  - `docker tag test-build:1.0 qjwemuta/test-build:1.0`
- `docker login`
  - Va demander l'username
  - Puis le password
- `docker push [USER]/[REPOSITORY]:[VERSION]`
  - `docker push qjwemuta/test-build:1.0` Push l'image en ligne sur [hub.docker.com](https://hub.docker.com)
- L'image de ce build est désormais en ligne et disponible via : `docker run -d --name custom-build-pull -P qjwemuta/test-build:1.0`


## Docker compose
### Version de docker compose
- `docker compose version`
### Créer un docker compose
- Créer un fichier : `docker-compose.yaml`
```
version: "3.0"
services:
  frontend:
    image: wordpress
    depends_on:
      - "database"
    ports:
      - "2200:80"
    environment:
      WORDPRESS_DB_HOST: database
      WORDPRESS_DB_USER: wordpress_user
      WORDPRESS_DB_PASSWORD: wordpress_pass
      WORDPRESS_DB_NAME: wordpress_db
  database:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: wordpress_db
      MYSQL_USER: wordpress_user
      MYSQL_PASSWORD: wordpress_pass
```
### Lancer docker compose
- `docker compose up -d` Deployer le docker compose dans le répertoir de la console
- `docker compose -f [FICHIER] up -d` Deployer un docker compose avec son chemin
  - `docker compose -f C:/Users/Administrateur/Desktop/compose`
- `docker compose down` Retire le docker compose
### Lister les docker compose
- `docker compose ls`
  - `docker compose ls -a`
- `docker ps` Liste les conteneurs (Dont ceux crée via un compose)
  - `docker ps -a`
### Supprimer un docker compose
- `docker compose rm [SERVICE]`
  - `docker compose rm -f [SERVICE]`
  - `docker compose rm c4b6a2cf9b59`

## Docker swarm
### Créer un docker swarm
Swarm = essaim
Master = maître
Worker = travailleur
#### Master
- `docker swarm init`

#### To filter & test
```
Docker SWARM

Initialization
on the master node
docker swarm init

Verify
On the master
docker node ls

expected output
root@ip-172-31-11-138:~# docker node ls
 ID                            HOSTNAME       	STATUS	AVAILABILITY   MANAGER STATUS   ENGINE VERSION
 rw5smxfjirgeawcdm9j6nlbf1     ip-172-31-5-216	Ready 	Active                      	19.03.12
 u02f28589h8aiwj8nawro978v *   ip-172-31-11-138   Ready 	Active     	Leader       	24.0.2
 upujlvvpo7um8zqzyx5kness4     ip-172-31-14-123   Ready 	Active                      	19.03.12

Services
Create
docker service create --name firstsvc nginx

List
docker service ls

List containers belonging to a service
docker service ps firstsvc

Set the scale
docker service scale firstsvc=6
 docker service ps firstsvc #check the new containers

Delete
docker service rm firstsvc

Global vs Replicated Services
docker service create --name replicated-svc nginx #default mode is replicated

 
docker service create --name global-svc --mode global nginx

Publish Services
docker service create --name published-svc --mode global -p 3333:80  nginx

Access application running in service
curl 'any-one-nodes-ip-address':3333

Run service on specific node
docker service create --name node-specific-svc --constraint "node.hostname == <hostname>" --replicas 5 

Scale service instances
Each service defined in Docker compose configuration can be scaled using below command

docker-compose scale <service name> = <no of instances>

For example :

docker-compose scale redis-master=3

Although services can be scaled but you could get arbitrary range of ports assigned since the ports are randomly assigned by Docker engine.This can be controlled by assigning port range on the ports section of compose yaml file.

services: 

redis-master: 

image: redis:latest 

ports: - "6379-6385:6379"
Scaling can also be done by using up command as well with the --scale flag.

docker-compose up --scale redis-master=3 -d
```
# Soon
## Docker deploy private registry
## Docker secrets