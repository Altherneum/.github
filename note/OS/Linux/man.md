# Manuel
## Man
- `man [CMD]` Manuel
  - `man man` Affiche le manuel de la commande `man`
  - `Man sudo` Affichel le manuel de sudo
- `Man [CMD] -k` ???
### Chapitres du manuel
- `Man [NOMBRE] [CMD]` Chapitre lié au manuel de la commande :
  - 1 : Programmes exécutables ou commandes de l'interpréteur de commandes (shell)
  - 2 : Appels système (fonctions fournies par le noyau)
  - 3 : Appels de bibliothèque (fonctions fournies par les bibliothèques des programmes)
  - 4 : Fichiers spéciaux (situés généralement dans /dev)
  - 5 : Formats des fichiers et conventions. Par exemple /etc/passwd
  - 6 : Jeux
  - 7 : Miscellaneous (including macro packages and conventions), e.g. man(7), groff(7), man-pages(7)
  - 8 : Commandes de gestion du système (généralement réservées au superutilisateur)
  - 9 : Sous-programmes du noyau [hors standard]

## Whatis
- `whatis [COMMANDE]` Permet d'afficher une ligne de description de la commande provenant de `man`
### Whatis dans une langue
  - `whatis -L [LANGUE] [COMMANDE]`
    - `whatis -L fr man` Affiche la description `whatis` en Français de la commande `man`
    - `whatis -L en man` Affiche la description `whatis` en Anglais de la commande `man`