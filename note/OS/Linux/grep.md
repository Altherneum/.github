# grep
La commande grep est un outil puissant sous Linux/Unix pour rechercher des motifs textuels (mots, phrases, expressions régulières) dans des fichiers ou des flux de données
## Définition
- `grep [options] <MOT_CLEF> <FICHEIR>`
  - Exemple `grep "erreur" /var/log/syslog`
## Options
- `i` : Insensible à la casse (grep -i "erreur" trouve "Erreur", "ERREUR", etc.)
- `n` : Affiche le numéro de ligne
- `r` : Recherche récursive dans les sous-dossiers
- `w` : Recherche un mot entier uniquement
- `c` : Compte le nombre de lignes correspondantes
- `l` : Affiche seulement les noms des fichiers qui contiennent le motif
- `A 3` : Affiche 3 lignes après la correspondance
- `B 3` : Affiche 3 lignes avant
- `C 3` : Affiche 3 lignes avant et après
- `v` : Inverse la recherche : elle affiche les lignes qui ne contiennent pas le motif. 
## zmore & grep
`zmore /var/log/apache2/*.* | grep -v <VOTRE_IP> | grep <MOT_CLEF>`
- Permet de scanner tout les fichiers de log apache
- Puis retire les lignes avec votre IP
- Puis cherche le Mot clef dans la liste