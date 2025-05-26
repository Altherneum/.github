# Who
- `who` Afficher les utilisateurs connectés au système
## Paramètres de la commande Who
  - `who -a` Affiche toutes les informations d'utilisateurs (`--all`) 
  - `who -q` Affiche le nombre d'utilisateurs (`--count`)
  - `who -m` Affiche uniquement l'utilisateur associé avec le `stdin`
  - `who -u` Liste les utilisateurs connectés
  - `who -T`,`-w`, ou `--mesg` Affiche les utilisateurs avec leurs statut
  - `who am i` Commande rapide pour `who -am` (`-i` n'est pas une option possible)

## Exemple de Who
```
root@vps:~# who
admin    pts/2        2025-05-25 20:17 (123.123.123.123)
```