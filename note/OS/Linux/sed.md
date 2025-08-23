# Sed
La commande `sed`, qui signifie "**__Stream EDitor__**", est un outil puissant sous Linux utilisé pour effectuer des transformations de texte sur un flux d'entrée, qu'il s'agisse d'un fichier ou d'une entrée provenant d'un pipeline

Elle est particulièrement utile pour le remplacement de texte, l'impression de lignes spécifiques, la suppression de lignes, l'ajout de texte, et l'utilisation d'expressions régulières pour des correspondances complexes

## Exemple de sed
- `sed -i 's/ancienneChaine/NouvelleChaine/' /test.txt` Permet de modifier dans le fichier `test.txt` les mots `ancienneChaine` par `NouvelleChaine`

## Expressions particulières
### sed space filter
L'expression régulière `s/^[[:space:]]*` est utilisée pour supprimer les espaces blancs (espaces, tabulations, retours à la ligne, etc.) au début d'une chaîne de caractères.

Elle est couramment utilisée dans des outils comme sed pour nettoyer les chaînes de texte en supprimant les espaces ou caractères blancs en début de ligne
Le motif `^[[:space:]]*` correspond à un ou plusieurs caractères blancs situés au début de la chaîne, où `^` indique le début de la ligne et `[[:space:]]*` correspond à zéro ou plusieurs caractères blancs.

Cette expression est particulièrement utile pour traiter des fichiers texte où les lignes peuvent avoir des indentations inutiles
`sed -i 's/^[[:space:]]*# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers` par exemple permet de décommenter la ligne et retirer tous espaces inutiles