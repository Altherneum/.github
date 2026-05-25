# Introduction
## Introduction à PGP
PGP : `Pretty Good Privacy` Est un standard cryptographique (la méthodologie)
Il est conçu pour sécuriser les communications numériques, principalement par email ou fichiers
Son objectif est de garantir deux choses
- la confidentialité (seul le destinataire peut lire)
- l'intégrité/l'authenticité (le message n'a pas été modifié en chemin et vient bien de l'expéditeur déclaré)
## Introduction à GPG
GPG : `GNU Privacy Guard` Est le logiciel qui qui implémente la norme OpenPGP
GPG est une implémentation libre (open-source) très puissante du standard PGP
Il permet aux utilisateurs de réaliser les tâches de chiffrement et de déchiffrement définies par PGP
# Utilisation de GPG
## Chiffrement asymétrique
Le secret de PGP/GPG réside dans l'utilisation de ce qu'on appelle des clés asymétriques ou cryptographie à clé publique
Imaginez que vous ayez deux clés qui fonctionnent ensemble, mais pas en même temps
### La Paire de Clés privée et publique
Chaque utilisateur possède deux clés
- La Clé Publique `Public Key`
  - Vous la donnez à tout le monde.
  - Elle est disponible sur internet ou dans un carnet d'adresses cryptographique `Keyring`
  - Elle sert à chiffrer des messages destinés à vous, ou à vérifier votre signature numérique
- La Clé Privée `Private Key`
  - C’est votre seule possession
  - Elle doit rester secrète et protégée par un mot de passe fort
  - Elle sert à déchiffrer les messages qui vous sont adressés, ou à créer votre signature numérique
## Le Processus de Chiffrement (Confidentialité)
Si Alice veut envoyer un message secret à Bob
- Alice récupère la Clé Publique de Bob
- Elle utilise cette clé pour chiffrer le message
- Le message crypté est envoyé à Bob
- Seul Bob, qui possède la Clé Privée correspondante, peut déchiffrer et lire le contenu du message
## Le Processus de Signature (Authenticité)
Si Alice veut prouver qu'elle a réellement écrit le message (et que personne ne l'a modifié)
- Elle utilise sa Clé Privée pour "signer" numériquement le document
- Alice envoie le document signé
- Bob utilise la Clé Publique d'Alice pour vérifier cette signature
- Si la vérification est positive, Bob sait deux choses
  - Seule Alice avait accès à cette clé privée (donc elle l'a signé)
  - Le document n'a pas été altéré depuis la signature
## Créer une clef GPG
- `gpg --full-generate-key`
- `gpg --gen-key`
  - `gpg --default-new-key-algo rsa4096 --gen-key` Préciser l'algorithme `RSA 4096`
## Signer et vérifier un message avec GPG
Commencer par créer un fichier
- Exemple : `echo "hello friend" > test.txt`
### Signature en claire avec GPG
`gpg --clearsign <message_file>` permet de signer en clair un message
  - `gpg --clearsign test.txt`
  - `more ./test.txt.asc`
```
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

hello friend

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQu/uYHDI2Z3jbjiE4VkpMGX0GQGQUCahSsFgAKCRAVkpMGX0GQ
GdpYAQCYphm8EY1D4kKkl8+GdleNKw4lnI8osJFsOV2GTM5qQwEAsUcAWjfu2zaE
3zOKSgN71qiS7cEqoZE5uN4Aond3YgY=
=geGn
-----END PGP SIGNATURE-----
```
### Signature détachée avec GPG
`gpg --detach-sign --armor <message_file>` permet de créer une signature hors du fichier originel, préservant le message intacte (Par exemple pour des fichiers executables)
  - `gpg --detach-sign --armor test.txt`
  - `ls -la test.*`
```
-rw-r--r-- 1 admin admin  13 25 mai   22:06 ./test.txt
-rw-r--r-- 1 admin admin 228 25 mai   22:14 ./test.txt.asc
```
  - `more test.txt.asc`
```
-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQu/uYHDI2Z3jbjiE4VkpMGX0GQGQUCahStpgAKCRAVkpMGX0GQ
GXbuAP9WAH9lt3p6UjLkZRrrIF9IWs8/xOJpmReMC+8tQmZirgEAnlb/nznRKol8
cbYMbS3hxY8Fs26YaCcNwH6NFLr9DQg=
=il9H
-----END PGP SIGNATURE-----
```
### Vérifier une signature GPG
#### Vérifier une signature GPG
- `gpg --verify <signature>.asc` Pour les fichiers avec une signature ou une signature en claire
  - `gpg --verify test.txt.asc`
```
gpg: Signature faite le lun. 25 mai 2026 22:33:20 CEST
gpg:                avec la clef EDDSA 2EFEE6070C8D99DE36E3884E159293065F419019
gpg: Bonne signature de « Altherneum.fr <root@altherneum.fr> » [ultime]
```
#### Vérifier une signature GPG détachée
- `gpg --verify <signature>.asc <file>` Pour les fichiers avec une signature détachée
  - `gpg --verify test.txt.asc test.txt`
```
gpg: Signature faite le lun. 25 mai 2026 22:14:30 CEST
gpg:                avec la clef EDDSA 2EFEE6070C8D99DE36E3884E159293065F419019
gpg: Bonne signature de « Altherneum.fr <root@altherneum.fr> » [ultime]
```
## Chiffrer un message avec GPG
- Importé la clef publique du contact : [# importer une clé publique](#importer-une-clé-publique)
### Créer un fichier à chiffrer
- `echo "Testing GPG" > test.txt`
### Chiffrer le fichier
- `gpg --encrypt --armor --recipient <email_du_destinataire> <fichier>` Demandera de valider d'écrire par dessus le fichier ou de changer le nom
  - `gpg --encrypt --armor --recipient root@altherneum.fr test.txt`
### Chiffrer dans un nouveau fichier
  - `gpg --output <file_output> --encrypt --armor --recipient <contact_e-mail> <file_input>`
  - `gpg --output test.txt.gpg --encrypt --armor --recipient root@altherneum.fr test.txt` Créer le fichier chiffré `test.txt.gpg` et sa signature `test.txt.asc` à destination de `root@altherneum.fr`
- `more test.txt.gpg`
```
-----BEGIN PGP MESSAGE-----

hF4D/vWSeBQr3h8SAQdAnRDPDMFZnSdFNQr7OxMARoHyZ9Zq4oBUH3PhL+iusHIw
MzBrGEmOJDp93trLBXDAPp7hVbgntM/7vpScv2hzhb/XAQ8iaucfQwU+kluJ7fJ0
0k4BtLALbr2Rmtp2XxxOB/s2gvNF1plXw0LJJmZSg2r9sZWUILlrrafjYNX33HVQ
rVroAtg3G1Dy+moe9LpBMzZCMKXlZY7dr5Iybd44zNY=
=waC/
-----END PGP MESSAGE-----
```
## Déchiffrer avec GPG
- `gpg --decrypt <file>`
  - `gpg --decrypt test.txt.gpg`
``` 
gpg: chiffré avec une clef cv25519, identifiant FEF59278142BDE1F, créé le 2026-05-25
      « Altherneum.fr <root@altherneum.fr> »
Testing GPG
```
## Lister les clés publiques
- `gpg --list-keys`
```
[keyboxd]
---------
pub   ed25519 2026-05-25 [SC] [expire : 2029-05-24]
      2EFEE6070C8D99DE36E3884E159293065F419019
uid          [  ultime ] Altherneum.fr <root@altherneum.fr>
sub   cv25519 2026-05-25 [E] [expire : 2029-05-24]
```
## Lister les clés privées
- `gpg --list-secret-keys`
```
[keyboxd]
---------
sec   ed25519 2026-05-25 [SC] [expire : 2029-05-24]
      2EFEE6070C8D99DE36E3884E159293065F419019
uid          [  ultime ] Altherneum.fr <root@altherneum.fr>
ssb   cv25519 2026-05-25 [E] [expire : 2029-05-24]
```
## Exporter une clé privée
- `gpg --output <key_name>.asc --armor --export-secret-keys <mail>`
  - `gpg --output private_key_backup.asc --armor --export-secret-keys root@altherneum.fr`
  - `more private_key_backup.asc`
```
-----BEGIN PGP PRIVATE KEY BLOCK-----
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAA
AAAAA
-----END PGP PRIVATE KEY BLOCK-----
```
## Exporter une clé publique
### Exporter une clé publique dans un fichier
- `gpg --export --armor --output <file>.asc <user>`
  - `gpg --export --armor --output public-key.asc root@altherneum.fr`
  - `more public-key.asc`
```
-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEahSdQRYJKwYBBAHaRw8BAQdA9ygzZiF/Hnh6F047oXMqDfrKuCHOFKe6RNqn
McRaWxy0IkFsdGhlcm5ldW0uZnIgPHJvb3RAYWx0aGVybmV1bS5mcj6IlgQTFgoA
PhYhBC7+5gcMjZneNuOIThWSkwZfQZAZBQJqFJ1BAhsDBQkFo5qABQsJCAcCBhUK
CQgLAgQWAgMBAh4BAheAAAoJEBWSkwZfQZAZx04A/3IRsFgKyLdlYrMDQqdyyuaD
vLh3j0xJxEDlXMvYv+U6AP9uEnr59H8L3HNhC/nXDCyPtqE2PmAvqSjA5bwrDdGa
Crg4BGoUnUESCisGAQQBl1UBBQEBB0Bz/7RE+bROxrjznB53mMJBwuZaLHdccYkc
gy6kKXhhJgMBCAeIfgQYFgoAJhYhBC7+5gcMjZneNuOIThWSkwZfQZAZBQJqFJ1B
AhsMBQkFo5qAAAoJEBWSkwZfQZAZGfsBAOGpDb7J/X5hedMKhxmjPt8B2qdMSdAS
vsRrQW1u34MkAP4/PJBNn3ZwTDwOdxwQWbfAG5s39GisF71ejBbvG6FbCQ==
=JfkG
-----END PGP PUBLIC KEY BLOCK-----
```
### Exporter une clé publique directement
- `gpg --armor --export <user>`
  - `gpg --armor --export root@altherneum.fr`
## Importer une clé publique
- `gpg --import <fichier>.asc`
  - `gpg --import public-key.asc`