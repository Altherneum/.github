# TMP
## Définition de /tmp
- Le répertoire `/tmp` est un répertoire utilisé dans les systèmes Unix et Linux pour stocker des __**fichiers temporaires**__
- Ces fichiers sont généralement créés par des programmes pour stocker des données temporaires pendant leur exécution
- Le répertoire `/tmp` est __**accessible à tous les utilisateurs**__ du système et est souvent utilisé pour stocker des fichiers temporaires qui ne sont pas nécessaires après la fin de l'exécution d'un programme
- __Les fichiers temporaires dans `/tmp` peuvent être supprimés sans problème__, **__à condition qu'ils ne soient pas en cours d'utilisation__**.
  - Cependant, il est important de noter que certaines applications peuvent utiliser des fichiers dans `/tmp` pour fonctionner correctement, et la suppression de ces fichiers peut entraîner des problèmes
## Nettoyer /tmp
- `find /tmp -ctime +10 -exec rm -rf {} +` supprime tout les fichiers de plus de 10 jours du dossier `/tmp`
  - `rm -rf /tmp` supprime tout le dossier `/tmp`