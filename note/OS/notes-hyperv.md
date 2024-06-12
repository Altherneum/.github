# Hyperviseur
## Niveau 1
Se suffit à lui même (N'a pas besoin d'un OS) et virtualise
- Ex : ESXI, Vsphere

## Niveau 2
Requiert un OS (Windows / Linux)
- Ex : VirtualBox, HyperV, VMWare Workstation, 

## Créer un PC virtuel
- Nouveau ➡ Ordinateur virtuel

- `C:\Users\Administrateur\Desktop\Hyper-V`
- 📜 `Win22-SRV-1` ➡ [**OS**][**AGE**]-[**SRV/PC**]-[**ID**])
- 👴 Génération 2
- 🧠 Mémoire dynamique 2048Mo
- 📂 50Go storage
- Service invité
- 💽 Installer l'ISO (Windows Server Datacenter user experience (GUI))

### Paramètres 
- 2 CPU virtuel
- Service d'intégration Service d'invité

### ISO
![Lecteur DVD et ISO](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_TWnWBAwE7M.png)
- Paramètres [Win22-SRV-0](#Win22-SRV-0) ➡ Lecteur DvD ➡ Ajouter ➡ Lier l'ISO
  - sources_iso (srvapp.m2iformation.local) (Y:\)
    - /Microsoft/Windows Server 2022 Evaluation
    - /Microsoft/Windows 10 Evaluation

## Créer un commutateur virtuel
- Gestionnaire de commutateur virtuel
- Privé ou interne

![Configuration](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_ViSv9fGoJe.png)

# Tâches
![Exemple de réseau à créer](https://github.com/Altherneum/.github/blob/main/note/assets/Teams_kWashgWdFC.png?raw=true)

# Adressage
## Win22-SRV-0
- IP
- Masque
- Gateway

## Commutateur / Switch
### NAT
- Interne
- `NAT`

### Serveurs
- Privé
- `Serveurs`

### Clients
- Privé
- `Clients`
