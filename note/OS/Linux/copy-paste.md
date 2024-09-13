# Copy & paste
Le presse-papier est la fonction qui garde en mémoire des éléments lors d'un « couper » ou « copier » (`Ctrl` + `x` et `Ctrl` + `c` dans la plupart des applications) puis que l'on « colle » (généralement avec la combinaison de touche `Ctrl` + `v`)

## Sans outil
### Touche Ctrl + Shift
Sur Ubuntu et de nombreuses autres distributions Linux, vous pouvez utiliser `Ctrl` + `Insert` ou `Ctrl` + `shift` + `C` pour copier du texte et `Shift` + `Insert` ou `Ctrl` + `shift` + `V` pour coller du texte dans le terminal

### Clique droit interactif
Sélectionnez le texte dans le terminal, faites un `clic droit` et sélectionnez `Copier`

De même, pour coller le texte sélectionné, cliquez avec le `bouton droit` et sélectionnez `Coller`

### Clique milieu
Vous pouvez sélectionner le texte que vous souhaitez copier, puis appuyer sur le `bouton central de la souris` (molette de défilement) pour coller le texte copié

## Note
### Ctrl + C
Aucun terminal Linux ne vous donnera `Ctrl` + `C` pour copier le texte. En effet, par défaut, la combinaison de touches `Ctrl` + `C` est utilisée pour envoyer un signal d'interruption à la commande exécutée au premier plan. Cela arrête généralement la commande en cours d'exécution

### Ctrl + S
Vous avez utilisé `Ctrl` + `S` et bloqué le terminal ?

Le raccourci clavier `CTRL` + `S` dans le terminal Linux est utilisé pour envoyer un signal "stop" au terminal, ce qui entraîne un terminal gelé. Utilisez simplement `Ctrl` + `Q` et vous pourrez à nouveau utiliser le terminal

## Sur Wayland
### Copy
- `wl-copy "[text]"` Copy the text to the clipboard
- `[ls] | wl-copy` Pipe the command (ls) output to the clipboard
wl-copy --clear Clear the clipboard
wl-copy --paste-once "[text]" Copy for only one paste and then clear it
### Paste
wl-paste
wl-paste -n > clipboard.txt
## Avec xclip
### Copy
- `uptime | xclip`
- `xclip fichier.txt` Copie le contenu de fichier.txt dans le presse papier.
### Paste
- `xclip -o > fichier` Qui copie le presse-papier vers un fichier.
  - `-o` imprime le presse-papier