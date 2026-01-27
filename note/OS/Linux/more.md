# more
- La commande more est un utilitaire en ligne de commande utilisé pour afficher le contenu de fichiers texte page par page dans un terminal
- Elle est disponible à la fois sous Windows et Unix/Linux, bien que ses options varient légèrement selon le système d’exploitation
## Exemple
`more < nom_du_fichier` ou `more nom_du_fichier`
## Paramètres
-`/c` Efface l’écran avant d’afficher chaque page
-`/p` Traite les caractères de saut de page (form feed) comme des sauts complets
-`/s` Remplace plusieurs lignes vides consécutives par une seule ligne vide
-`/t<n>` Remplace les tabulations par n espaces (ex: /t4)
-`+<n>` Commence l’affichage à partir de la ligne n
-`/?` Affiche l’aide
## Commandes interactives
- `Barre d’espace` : Page suivante
- `Entrée` : Ligne suivante
- `q` : Quitter
- `=` : Afficher le numéro de ligne actuel
- `p` : Afficher les n lignes suivantes
- `s` : Sauter n lignes
- `?` : Afficher l’aide des commandes

# zmore
`zmore` fonctionne comme la commande more, mais avec une différence majeure :
- Elle décompresse automatiquement à la volée les fichiers au format `.gz`, `.Z`, `.bz2`, etc.
- Puis affiche leur contenu page par page.
- Elle s’appuie sur des outils comme `gzip` ou `uncompress` pour lire les fichiers compressés.
## Exemple
`zmore /var/log/apache2/<fichier>.gz` Permet de lire les fichiers même compressés via `more`

# Lire plusieurs fichiers
La commande `more` peut être utilisée avec le caractère générique `*` pour afficher **plusieurs fichiers texte à la suite**, page par page. 
## Exemple
- `more /home/admin/*.txt` affiche tout les `.txt`
- `zmore /var/log/apache2/error.*` Affiche tout les fichiers `error.log` et ceux compressés
- `more /var/log/apache2/*.*` Affiche tout les types de logs `apache` non compressés
### Fonctionnement
- `more` commence par afficher le **premier fichier** (ordre alphabétique). 
- À la fin du fichier, il affiche `--More-- (Next file: fichier2.txt)` et attend une action.
- Appuyez sur **Espace** pour passer au fichier suivant. 
- Tapez `:n` pour **sauter au fichier suivant**, `:p` pour **revenir au précédent**. 