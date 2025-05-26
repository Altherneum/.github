# Shebang
Le shebang, représenté par `#!`, est un en-tête d'un fichier texte qui indique au système d'exploitation (de type Unix) que ce fichier est un script (ensemble de commandes) et non un fichier binaire

Sur la même ligne est précisé l'interpréteur permettant d'exécuter ce script, comme par exemple `#!/bin/bash`

## Exemples de Shebang
### Shebang classiques
- `#!/bin/sh`
- `#!/bin/sh -x`
- `#!/bin/bash`
### Autres Shebang
- `#!/usr/bin/perl`
- `#!/usr/bin/tcl`
- `#!/bin/sed -f`
- `#!/usr/awk -f`
### Shebang Python
- `#!/usr/bin/env python`
- `#!/usr/bin/env python2`
- `#!/usr/bin/env python2.7`
- `#!/usr/bin/python -O`

## Exemples de script avec Shebang
Le script peut être nommé `/script-exemple` ou `/script-exemple.sh`, le SheBang précisant la console à utiliser

```
#!/bin/sh
echo $0
```

Ce script permet de lancer une console, et afficher via l'`echo $0` d'afficher la console en cours d'utilisation

- Pensez à rendre le fichier exécutable via `chmod +x /script-exemple`
- Puis exécuter le avec `./script-exemple`