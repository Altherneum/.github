# Hyper-v
## Créer un PC virtuel
- Menu : `Nouveau` ▶ `Ordinateur virtuel`

- Disque dur virtuel `C:\Users\Administrateur\Desktop\Hyper-V`
- 📜 [**OS**][**Date**]-[**SRV/PC**]-[**ID**]
  - Exemple : `Win22-SRV-1`
- 👴 Génération 2
- 🧠 Mémoire dynamique ▶ 2048Mo
- 💻 2 V-CPU
- 📂 50Go storage
- 💾 `Services d'intégration` ▶ `Services d'invité` ✅
- 💽 Installer l'ISO (`Windows Server Datacenter user experience` (GUI))

### ISO
![Lecteur DVD et ISO](https://github.com/Altherneum/.github/blob/main/note/assets/images/chrome_TWnWBAwE7M.png?raw=true)
- `Paramètres` : `Win22-SRV-1` ▶ `Lecteur DvD` ▶ `Fichier image` ▶ `Parcourir` pour lier l'ISO
  - sources_iso (`Y:\`)
    - `/Microsoft/Windows Server 2022 Evaluation`...
    - `/Microsoft/Windows 10 Evaluation/`...
- Penser à retirer l'ISO (Pour pouvoir le déplacer / supprimer)

## Créer un commutateur virtuel
- Menu : `Gestionnaire de commutateur virtuel`
- `Privé` ou `interne` ou `externe` à la carte réseau  
(voir [Adressage](https://doc.altherneum.fr/cours/enterprise-network#Adressage))

![Configuration](https://github.com/Altherneum/.github/blob/main/note/assets/images/chrome_ViSv9fGoJe.png?raw=true)

### Connecter les cartes réseaux
![ajouter des cartes réseau](https://github.com/Altherneum/.github/blob/main/note/assets/images/chrome_QRr4HxxUCH.png?raw=true)

![cartes réseau](https://github.com/Altherneum/.github/blob/main/note/assets/images/chrome_6iWU7wUKqo.png?raw=true)

### Connecter NAT vers un réseau externe
- Dans `Gestionnaire de commutateur virtuel` sur Hyper-V
- `NAT`, `Type de connexion` : `Réseau externe` pour utiliser la carte réseau connecté à la machine qui utilise Hyper-V
- Dans le `Win22-SRV-RTR-1`, `Routage et accès à distance` :
  - `Win22-SRV-RTR-1`, `IPv4`, `NAT`
  - `Clique droit` sur `01-NAT` : `Propriétés`
  - `Services et ports` ; Activer `HTTP` et `HTTPS` avec comme adresse IP `192.168.10.10`

# Autres notes
## CTRL ALT SUPPR
![touche](https://github.com/Altherneum/.github/blob/main/note/assets/images/chrome_9hxQEdb0vA.png?raw=true)

## Session étendu
### Possibilités du mode de session étendu
- copier / coller
- partager des fichiers depuis le PC physique
- Touches clavier

### Ajouter le mode de session étendu
- Menu : `Paramètres Hyper-V`
- Catégorie `Mode de session étendu`

![paramètre](https://github.com/Altherneum/.github/blob/main/note/assets/images/chrome_WhqhXRQbdJ.png?raw=true)