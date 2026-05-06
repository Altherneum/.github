# Fail2ban
## Installation de fail2ban
Pour installer fail2ban sur Ubuntu : ˋapt-get install fail2banˋ
## Création d'un filtre
## Ajout d'un envoie par mail
## Débannir une adresse IP
La commande fail2ban permet de bannir et débannir une adresse IP
- Pensez à soit ajouter ˋsudoˋ devant la commande
- Ou à être en ˋrootˋ
Sinon vous n'aurez pas assez de privilège pour exécuter la commande
### Débannire une adresse IP d'une jail
ˋfail2ban-client set my-super-ssh-jail unban 192.168.1.123ˋ Retire le ban sur l'adresse IP ˋ192.168.1.123ˋ dans la jail ˋmy-super-ssh-jailˋ
### Débannire une adresse IP de toutes les jailss
ˋfail2ban-client unban 192.168.1.123ˋ Retire tout ban sur l'adresse IP : ˋ192.168.1.123ˋ