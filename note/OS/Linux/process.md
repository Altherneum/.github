# Processus et services 
## Top processus
- `top`

![ssh top](https://github.com/Altherneum/.github/assets/84735589/e7e272f8-3da0-4ca9-a531-391a38c27ea9)

## free RAM
- `free` affiche l'utilisation de la RAM
- `free --mega` affiche en méga octet (Fonctionne aussi avec `--giga`)

![ssh free](https://github.com/Altherneum/.github/assets/84735589/4817a67a-97d9-4a29-9e72-a00d2818800f)

## Process statuses
- `ps` Permet de lister les processus en cours
- L’option `ps a` affiche tous les processus en cours d’exécution de tous les utilisateurs du système
- L’option `ps u` fournit des informations supplémentaires telles que le pourcentage d’utilisation de la mémoire et du CPU, le code d’état du processus et le propriétaire des processus
- L’option `ps x` Liste de tous les processus qui ne sont pas exécutés à partir du terminal
- Les options peuvent être cumulés `ps aux`

- L'option `ps -u [User]` Liste les processus d'un utilisateur
- `ps -T` Liste les processus actifs à partir du terminal
- `ps -C [Nom]` Liste les processus en filtrant par nom

## Services
- `Systemctl`
### Relancer un service
  - `Systemctl restart [SystemProcess]`
  - `Systemctl reload [SystemProcess]`

### Arrêter ou démarrer un service
  - `Systemctl stop [SystemProcess]`
  - `Systemctl start [SystemProcess]`

### Status d'un service
  - `Systemctl status [SystemProcess]`

### Pauser ou tuer un service
  - `Systemctl kill [SystemProcess]`
  - `Systemctl freeze [SystemProcess]`

### Désactiver ou réactiver un service
  - `Systemctl disable [SystemProcess]`
  - `Systemctl enable [SystemProcess]`