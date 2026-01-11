# Historique
- `history`
```
 History n°3 =[$]> history 
    1  history --help
    2  history
    3  echo "History"
```
## Voire une commande de l'historique
- `history | grep <CMD>`
## Vider l'hitorique
- `history -c`
### Lancer une commande en vidant l'historique
- `history -c && <CMD>`
  - exemple `history -c && clear && fastfetch` Purge l'historique et le terminal, puis affiche fastfetch
## Voire une entrée de l'historique
## Voire les dernières entrées de l'historique
- `history 3` Affiche les 3 derniers résultats
- `history 2` Affiche la dernière commande (ainsi que `history 2`)
- `history 1` Ne va que afficher la commande `history 1`