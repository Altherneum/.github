# Anti DevTools
## Site inspected
Streaming website : `papadustream`

## Code used
```
function devtoolIsOpening() {
    console.clear();

    let before = new Date().getTime();
    debugger;
    let after = new Date().getTime();

    if (after - before > 200) {
        document.write(" Dont open Developer Tools. ");
        window.location.replace("https://www.google.fr");
    }
    setTimeout(devtoolIsOpening, 100);
}
devtoolIsOpening();
```

## Hack
- Charger la page web
- Ouvrir le DevTools du navigateur
- Aller sur l'onglet `Network`
  - ![alt text](https://github.com/Altherneum/.github/blob/main/note/assets/images/devToolsNetwork.png?raw=true)
- Recharger la page avec `F5`
- Retourner sur l'onglet `Network`
- Cliquer sur le fichier portant le nom du site
- Aller dans l'onglet `Response` du fichier
  - ![alt text](https://github.com/Altherneum/.github/blob/main/note/assets/images/devToolsNetworkSeePage.png?raw=true)
- Consulter le code
  - ![alt text](https://github.com/Altherneum/.github/blob/main/note/assets/images/DevToolsNetworkSeeCode.png?raw=true)
- Ne pas sortir du Debugger sans modifier la page car la prochaine instruction par défaut sera de charger la page [www.google.fr](https://www.google.fr)