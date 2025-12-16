# WikiJS

![image wikiJS](https://js.wiki/img/wikijs-full-2021.b840e376.svg)

## Chapitres

* [Installation](#installation)
* [Prémisse du projet](#prémisse-du-projet)
* [Question lié au périmètre](#questions-lié-au-périmètre)

  * [Machine à utiliser](#machines-à-utiliser)
  * [Règles lié à SSH](#règles-lié-à-ssh)
  * [Règles d'environement d'installation](#règles-denvironement-dinstallation)
  * [Règles réseau](#règles-réseau)

* [Gestion du domaine](#gestion-du-domaine)
* [Règle d'administration](#règle-dadministration)

[Script d'installation sur RedHat](https://raw.githubusercontent.com/Altherneum/.github/main/note/OS/Linux/WikiJS-Redhat-installation.sh)
## Qu'est ce que WikiJS ?

* Wiki.js est un moteur wiki fonctionnant sur Node.js et écrit en JavaScript
* Il s'agit d'un logiciel libre publié sous la licence publique générale Affero GNU.
* Il est disponible en solution auto-hébergée ou en installation « en un seul clic » ou en installation « en un seul clic "web" » sur la place de marché DigitalOcean.

## Sites et URL

![images du site](https://js.wiki/img/wiki-screenshot.3d2d7f34.png)

* [Site](https://js.wiki/)
* [Github](https://github.com/Requarks/wiki)
* [Installation](https://docs.requarks.io/install)

  * [Installation via docker](https://docs.requarks.io/install/docker)

    * [Install requierements](https://docs.requarks.io/install/requirements)

  * [Installation via docker desktop](https://docs.requarks.io/install/docker-desktop)
  * [Graph API](https://docs.requarks.io/dev/api)

## Exigences d'installation

Wiki.js runs on virtually any system where Node.js is supported.
This means it runs on Linux, macOS, Windows as well as container solutions such as Docker / Kubernetes and Heroku.

### Server

[Server requirements](https://docs.requarks.io/install/requirements#server-requirements)

#### CPU

* Wiki.js runs perfectly fine on a single CPU core. However, 2 cores or more are recommended to fully make use of the background workers.

#### RAM

* Linux systems should have at least 1GB of RAM to run Wiki.js. Windows and macOS systems usually require a bit more RAM.
* While the process itself usually sits at around 70MB of RAM, some events (such as page rendering, indexing, etc.) result in short bursts in RAM usage.
  Storage
* Storage requirements are based on the content you will enter. Wikis that consists almost exclusively of text are not likely to exceed a few megabytes. However, as soon as you upload images, videos or other files, you should plan your storage requirements accordingly.

#### Accès internet

* At least 1 GB of storage dedicated to Wiki.js is recommended.
  Internet Access
* Wiki.js will automatically check for new updates, languages, themes, etc. from time to time. You can read more about what data is downloaded.
* An alternate method of sideloading files is also available if your environment is cut from the internet.
  Domain

### Domaine

[Domain](https://docs.requarks.io/install/requirements#domain)

* Wiki.js requires a dedicated sub-domain / domain (e.g. wiki.example.com). You cannot map Wiki.js to a subfolder.

### Database

[Database](https://docs.requarks.io/install/requirements#database)

* For best performance, features and future compatibility, it's highly recommended to use PostgreSQL.

  * PostgreSQL 9.5 or later
  * It's recommended you use the latest version of PostgreSQL when possible.
  * Note that in order to use the PostgreSQL search module, the pg\_trgm extension must be available on the host. The extension is part of the postgresql-contrib package in most Linux distributions. The docker PostgreSQL image already includes the extension.

#### Autres DB supportés

* Wiki.js is also compatible with the following database systems:

  * MySQL 8.0 or later (MySQL 5.7.8 is partially supported, read more)
  * MariaDB 10.2.7 or later
  * MS SQL Server 2012 or later
  * SQLite 3.9 or later
  * These engines (MySQL, MariaDB, MS SQL Server and SQLite) will NOT be supported in the next major version of Wiki.js. Make sure you understand the implications of migrating your database to PostgreSQL if you plan on upgrading to 3.x+ in the coming years. An export + import tool will be made available at / shortly after release.
  * SQLite is not recommended for production deployments.

* You're expected to have installed one of these database engines already (either locally, on another server or using a cloud service). Wiki.js requires an empty database and preferably a unique user / pass to connect to the database.

### Node.js

[NodeJS](https://docs.requarks.io/install/requirements#nodejs)

* The Node.js runtime is required. The following versions are supported:

  * Node.js 22: version 22.0 or later. (since v2.5.302)
  * Node.js 20: version 20.0 or later. (since v2.5.300)
  * Node.js 18: version 18.0 or later. (since v2.5.300)
  * Odd-numbered versions (e.g. 23x, 21.x, 19.x) are NOT officially supported.

#### Using Docker? 🐳

* Skip this requirement! You don't need to install Node.js on your machine! It's included in the Docker image already.

### Web Server ☁️

* Wiki.js doesn't need any actual web server (such as nginx or Apache).

  * However, you might need to put a reverse proxy in front of Wiki.js if you require advanced network / DNS configuration.

### Supported Browsers

[Supported Browsers](https://docs.requarks.io/install/requirements#supported-browsers)

* The following browsers are supported:

  * Google Chrome (including Android version)
  * Mozilla Firefox
  * Microsoft Edge
  * Apple Safari (including iOS version)

* Note that only the latest stable version of these browsers are supported. All browsers are automatically updated in the background by default.

  * There's limited compatibility with IE11. Users will be able to read content but not perform any editing action or use interactive features.

## Installation

### Installation Linux manuelle

[Linux](https://docs.requarks.io/install/linux)

### Installation Kubernetes

[Kubernetes](https://docs.requarks.io/install/kubernetes)

### Installation manuelle (Ubuntu + Docker)

[Ubuntu](https://docs.requarks.io/install/ubuntu)

### Installation via Docker

* [docker desktop](https://docs.requarks.io/install/docker-desktop)

#### Docker file

* [create-the-installation-folder](https://docs.requarks.io/install/docker-desktop#h-2-create-the-installation-folder)

```
version: "3"
services:
 
  db:
    image: postgres:17-alpine
    environment:
      POSTGRES_DB: wiki
      POSTGRES_PASSWORD: wikijsrocks
      POSTGRES_USER: wikijs
    logging:
      driver: "none"
    restart: unless-stopped
    volumes:
      - db-data:/var/lib/postgresql/data
 
  wiki:
    image: ghcr.io/requarks/wiki:2
    depends_on:
      - db
    environment:
      DB_TYPE: postgres
      DB_HOST: db
      DB_PORT: 5432
      DB_USER: wikijs
      DB_PASS: wikijsrocks
      DB_NAME: wiki
    restart: unless-stopped
    ports:
      - "80:3000"
 
volumes:
  db-data:
```

#### Instructions

* Créer un dossier

  * Dans ce dossier créer le fichier `docker-compose.yaml`
  * Coller dans le fichier le [Docker file](#docker-file)

* Lancer un terminal via les touches `Windows` et `R`, puis taper `cmd`

  * Naviguer via `CD` dans le dossier : exemple ; `CD C:\Users\user\Desktop\JS-wiki`
  * Lancer la commande `docker compose up -d`

* Lancer un navigateur et aller sur `http://localhost` (après avoir patienté que docker lance WikiJS (1 à 2 minute, visible sur docker)

  * Configurer la page

    * En URL laisser : `http://wiki.localhost` (Afin de tester)

### Autres installations

* These guides are provided by the community and not officially supported.

  * Install on AWS ECS
  * Install on Azure Web App
  * Install on Heroku
  * Install on IBM Cloud Foundry
  * Install using Portainer

## Questions lié au périmètre

### Machines à utiliser

Afin d'installer WikiJS il nous faut une machine
Avec au minimum les conditions requise [d'exigence d'installation](#exigences-dinstallation)

#### Règles lié au groupe wheel / sudo

Afin de sécuriser l'hôte, nous devons savoir si des règles lié au groupe wheel / sudo sont à connaître ?

* Accès "Sudo less"
* Comptes de connexion

#### Règles lié à SSH

Afin de sécuriser le serveur SSH, nous devons savoir si des règles lié à ce protocol sont à connaitres ?

* Compte SSH root bloqué
* Comptes SSH avec clef privée uniquement
* Hook sur les connexions SSH via mail
* Changement du port SSH

#### Règles d'environement d'installation

Afin de permettre l'installation en suivant les règles établies, nous aurions besoin de savoir les règles lié à ces bonnes pratiques sont à connaitres ?

* Utilisation de docker

  * Si non ; Séparation des hôtes physiquement ou virtuellement

* Choix du système d'exploitation

#### Règles réseau

* Doit-on utiliser UFW afin de vérouiller le réseau sur l'hôte,
* Ou le réseau sera t-il vérouillé au niveau du matériel réseau (Firewall applicatif, routeur, etc) ?

### Gestion du domaine

#### Gestion du SSL

Afin de sécuriser les transactions réseau et tout échange de donnée, le projet requiert une certification SSL sur un nouveau domaine

* Pour cela, nous aurions besoin de savoir qui peut y avoir accès,
* Et qui doit-on contacter afin d'offisialiser la demande ?

#### Gestion du DNS

Afin de diriger les requêtes réseau vers le serveur WikiJS,
Nous devons ajouter une entrée DNS, tel que `wiki.TLD.countryCode`

* Pour cela, nous aurions besoin de savoir qui peut y avoir accès,
* Et les règles liés à ce sujet (Limitation des types d'enregistrement, load balancing, etc) ?

### Règle d'administration

#### Création des comptes administrateurs

Afin d'administrer le projet, nous aurions besoin de savoir si des comptes doivent être crée ?

* Compte super Admin (Requis pour l'installation)
* Compte de base de donnée (Requis si utilisé)
* Comptes SSH

  * Compte administrateur générique
  * Comptes nominatifs

* Comptes administrateur (Optionel)

#### Ajout du PAM Microsoft Azure Entra / WS-AD

Afin de permettre une connexion simplifié au projet, ce dernier prend en compte les connexions via un compte Microsoft, pour cela nous aurions besoin de savoir les règles souhaités sur ce sujet

* Utilisation d'Entra ID
* Utilisation d'un Windows Server Active Directory
* Utilisation de comptes via adresses mail sans OTA
* Autre, voire la liste d'intégration de WikiJS

##### Notes
* [Auth](https://docs.requarks.io/auth)
  * [LDAP](https://docs.requarks.io/auth/ldap)
  * [Azure](https://docs.requarks.io/auth/azure)
  * [Local](https://docs.requarks.io/auth/local)
  * [SAML](https://docs.requarks.io/auth/saml)
## Structure de disque
Nvmen1p0 : 2.60Go
/ : 629.3Mo
/var: 56Ko
/var/log: 4Ko
/tmp: 4Ko
/opt: 5.1Mo
/wiki519.6Mo
/etc1.4Mo
/lib : 764Ko
/dev est vide
/bin1.5Mo
/usr163.5Mo
### Détail de l'obtention du disque
via `du -sh` disk usage summarize, human(readable)
### Type de base de donnée
- `"DB_NAME=wiki",`
  - `"DB_TYPE=postgres",`