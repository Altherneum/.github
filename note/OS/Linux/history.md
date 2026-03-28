# Historique
- `history`
```
 History n°3 =[$]> history 
    1  history --help
    2  history
    3  echo "History"
```
- Fichier : `~/.bash_history`
  - (`/home/<USER>/.bash_history`)
## Voire une commande de l'historique
- `history | grep <CMD>`
## Vider l'hitorique
### Vider l'historique du terminal
- `history -c` Vide l'historique jusqu'à la prochaine session
### Vider définitivement l'historique
`rm ~/.bash_history` ou via `echo "" > ~/.bash_history`
### Lancer une commande en vidant l'historique
- `history -c && <CMD>`
  - exemple `echo "" > ~/.bash_history && history -c && clear && fastfetch` Purge l'historique et le terminal, puis affiche fastfetch
## Voire une entrée de l'historique
## Voire les dernières entrées de l'historique
- `history 3` Affiche les 3 derniers résultats
- `history 2` Affiche la dernière commande (ainsi que `history 2`)
- `history 1` Ne va que afficher la commande `history 1`

# ClipHist
![Image des historiques cliphist](https://github.com/Altherneum/.github/blob/main/note/assets/images/cliphist.png?raw=true)

- ClipHist est pour Arch Linux, Rofi
- ClipHist est pour "Clipboard History"

## Purger l'historique
`cliphist wipe` Vide l'historique de ClipHist

## ClipHist help
`cliphist <store|list|decode|delete|delete-query|wipe|version>`