# Agent.md

## Présentation du dépôt

Ce dépôt est le **dépôt .github** d’une organisation GitHub, dédié à la gestion de son profil et à la documentation interne. Il ne contient pas de code exécutable ; il s’agit principalement de fichiers Markdown contenant des cours, des notes, des études et des ressources sur l’informatique

- Le projet est nommé **altherneum** (serveurs de jeux et de développement FOSS open‑source)
- Un dossier `assets` stocke les images et autres médias utilisés dans les notes
- Il n’est pas nécessaire de compiler quoi que ce soit ; tout le contenu est statique
- Certains documents au format `.md` sont chargés sur le site [doc.altherneum.fr](https://doc.altherneum.fr) au travers d'un script markdown vers HTML

## Fichiers principaux à la racine

- **CODE_OF_CONDUCT.md** : Code de conduite GitHub
- **CONTRIBUTING.md** : Guide des contributions
- **LICENSE.md** : Licence du dépôt
- **SECURITY.md** : Informations de sécurité
- **SUPPORT.md** : Infos support
- **README.md** : Accueil du dépôt
- **note.md** : Index ou résumé des notes à trier et ajouter dans son propre fichier
- **profile/README.md** : Présentation du profil GitHub organisation
- **profile/URL.md** : URL du profil GitHub

## Arborescence des dossiers (`tree -d`)

```
├── note
│   ├── assets
│   │   ├── images
│   │   ├── PacketTracer
│   │   └── unsued
│   ├── Azure
│   │   └── template
│   │       ├── Disk
│   │       ├── Network
│   │       └── VM
│   ├── Code
│   │   ├── Java
│   │   ├── QML
│   │   ├── VSCode
│   │   └── Web
│   │       ├── Binaire
│   │       ├── CSS
│   │       ├── HTML
│   │       ├── JS
│   │       └── SQL
│   ├── Discord
│   ├── Games
│   ├── Github
│   │   └── Markdown
│   ├── Google
│   ├── IA
│   ├── Malware
│   │   ├── CVE
│   │   └── Discord
│   ├── Network
│   │   └── Cisco
│   ├── OS
│   │   ├── Container
│   │   ├── ESXi
│   │   ├── Linux
│   │   │   └── Arch
│   │   │       ├── Archinstall
│   │   │       └── Archterneum
│   │   │           └── files
│   │   ├── Termux
│   │   └── Windows
│   │       ├── Active-Directory
│   │       ├── PowerShell
│   │       ├── Scripts
│   │       └── Windows
│   ├── Retraite
│   ├── RTFM
│   └── Scam
└── profile
```

## Explication rapide des dossiers et fichiers

- **.** : racine du dépôt .github
- **note/** : répertoire central contenant toutes les notes et cours
  - **assets/** : ressources multimédias (images, PacketTracer, etc.)
    - *images/* : images utilisées dans les documents Markdown
    - *PacketTracer/* : captures de Packet Tracer
  - **Azure/** : modèles Azure (bicep) et documentation associée
    - *template/Disk*, *Network*, *VM* : sous‑répertoires pour différents types de ressources
  - **Code/** : exemples de code dans plusieurs langages
    - *Java/*, *QML/*, *VSCode/*, *Web/* (Binaire, CSS, HTML, JS, SQL) : dossiers dédiés aux langages
  - **Discord/** : notes sur l’utilisation de Discord
  - **Games/** : notes liées aux jeux vidéo
  - **Github/** : guides et tutoriels GitHub
    - *Markdown/* : exemples de fichiers Markdown
  - **Google/** : recherches Google, dorking
  - **IA/** : apprentissage machine / intelligence artificielle
  - **Malware/** : informations sur le malware (CVE, Discord)
    - *CVE/* : CVE spécifiques
  - **Network/** : concepts réseaux
    - *Cisco/* : configuration Cisco
  - **OS/** : systèmes d’exploitation
    - *Container/* : Docker, Kubernetes
    - *ESXi/* : VMware ESXi
    - *Linux/* : Commandes Linux expliqués
      - *Arch/* : scripts Arch Linux
        - *Archinstall/* : scripts d’installation d’Arch
        - *Archterneum/* : scripts spécifiques à l’installation de mon PC (archlinux)
          - *files/backgrounds*, *fonts* etc. : ressources utilisées dans les scripts
    - *Termux/* : scripts pour Termux
    - *Windows/* : scripts Windows, PowerShell, Active Directory
  - **Retraite/** : notes sur la retraite
  - **RTFM/** : documentation de référence (PDF)
  - **Scam/** : notes sur les arnaques
- **profile/** : informations relatives au profil GitHub de l’organisation
  - *README.md* : description du profil
  - *URL.md* : lien vers le profil

## Directives pour les IA collaboratrices

- **Orthographe** : corriger toute faute d’orthographe ou de grammaire dans les fichiers Markdown
- **Qualité** : si une note ou un cours contient une erreur technique, créer une issue détaillée (ou proposer une PR) afin que l’auteur puisse la corriger
- **Manque de contenu** : lorsqu’un chapitre est absent ou incomplet (ex. « manque un sujet sur les VLANs »), ouvrir une issue avec le titre : `Sujet manquant dans <nom du cours> : <nom de la partie manquante>`
- **Arch Linux** : la partie `OS/Linux/Arch` contient l’installation de mon PC sous Arch Linux ; les scripts sont destinés à être exécutés sur un système Arch servant de desktop et non sur d’autres distributions
- **Pas d’émoticônes excessifs** : garder une documentation claire, sans surcharge visuelle
- Ne pas utiliser `*` ou des chiffres `1.` en guise de début de ligne, mais utiliser les tiret et ne pas hésiter à utiliser des espacements pour les lignes tabulés !
- Ne pas mettre de point en fin de phrase, ou de virgule ou tout autre ponctuation autre que `!` ou `?`
- Ne pas utiliser les tableaux de préférences (sauf si il faut obligatoirement un format de tableau)
- Ne pas utiliser les doubles espaces en markdown pour créer une nouvelle ligne, mais préférez utiliser le retour à la ligne