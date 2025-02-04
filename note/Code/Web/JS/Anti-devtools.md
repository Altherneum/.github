# Anti DevTools
## Sites
### Streaming website
`papadustream`

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

### Attach event
[jsfiddle.net /composite /3r6dq51y](https://jsfiddle.net/composite/3r6dq51y/)
[dev.to /composite /a-simple-way-to-detect-devtools-2ag0](https://dev.to/composite/a-simple-way-to-detect-devtools-2ag0)

```
!function() {
	function detectDevTool(allow) {
  	if(isNaN(+allow)) allow = 100;
    var start = +new Date();
    debugger;
    var end = +new Date();
    if(isNaN(start) || isNaN(end) || end - start > allow) {
    	alert('DEVTOOLS detected. all operations will be terminated.');
      document.write('DEVTOOLS detected.');
    }
  }
  if(window.attachEvent) {
  	if (document.readyState === "complete" || document.readyState === "interactive") {
    	detectDevTool();
      window.attachEvent('onresize', detectDevTool);
      window.attachEvent('onmousemove', detectDevTool);
      window.attachEvent('onfocus', detectDevTool);
      window.attachEvent('onblur', detectDevTool);
    } else {
    	setTimeout(argument.callee, 0);
    }
  } else {
  	window.addEventListener('load', detectDevTool);
    window.addEventListener('resize', detectDevTool);
    window.addEventListener('mousemove', detectDevTool);
    window.addEventListener('focus', detectDevTool);
    window.addEventListener('blur', detectDevTool);
  }
}();
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