### Read
- `read ( )` La fonction read (une extension) lit un nombre à partir de l'entrée standard, où qu'elle soit appelée. Attention : cela peut causer des problèmes lors du mélange de données et d'un programme sur l'entrée standard. Le meilleur usage de cette fonction se situe dans un programme précédemment écrit qui a besoin d'entrée en provenance de l'utilisateur, mais qui ne permet jamais que l'utilisateur entre du code. La valeur de la fonction read est le nombre lu à partir de l'entrée standard en utilisant la valeur actuelle de la variable ibase comme base de conversion.
#### Exemple de Read input

```
echo "Entrez ABC ou break"
read response
if [ $response = "ABC" ]
  then echo "ok ABC"
elif [ $response = "break" ]
  then echo "breaking while ..."
  break
else echo "erreur faite ABC ou break :("
fi
```