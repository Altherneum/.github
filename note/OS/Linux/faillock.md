# Comptes bloqués via Faillock
## Vérifier un compte via faillock
- `faillock --user <USERNAME>` Cela affiche des informations sur le nombre de tentatives infructueuses, le dernier horodatage d'échec, la source (par exemple, TTY ou adresse IP) et l'état de validité
## Débloquer un compte via faillock
`faillock --user <USERNAME> --reset` Déverrouillera l'utilisateur spécifié. Cette commande nécessite des privilèges `root` ou `sudo` pour s'exécuter