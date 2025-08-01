# WSL
Minimum : Windows 10 version 2004 (Build >= 19041)
## Installation
`wsl --install`
### Ajouter les fonctions HyperV
Via un PowerShell Admin :
```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:HypervisorPlatform /all /norestart
```
### Mettre à jour
`wsl --update`
### Stoper WSL
- `wsl --shutdown`
  - Relancer ensuite WSL : `wsl`
## Installer une distro
### Installer la distro
- `wsl --install DISTRO-NAME`
  - `wsl --install archlinux`
#### Installer avec un nom
- `wsl --install DISTRO-NAME --name distro_custom_name`
  - `wsl --install archlinux --name arch`
### Lister les distro
- `winget --list`
### Supprimer la distro
- `winget uninstall --id "DISTRO-ID-NAME"`
  - `winget uninstall --id archlinux`
### Retirer une distro importée
- `wsl --unregister DISTRO-NAME`
  - `wsl --unregister archlinux`