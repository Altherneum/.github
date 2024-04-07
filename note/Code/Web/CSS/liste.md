Dans ce chapitre, nous allons présenter une liste des propriétés CSS accompagnée de leurs définitions en français.
**Attention** : Cette liste n'est pas exhaustive car le langage CSS est constamment évoluant et se perfectionnant avec chaque nouvelle version. Néanmoins, nous couvrirons ici les propriétés communes et les plus utilisées.
# Propriétés CSS : Liste et définitions
## Propriétés de base
### Color
Définit la couleur d'un élément CSS.
```
color: rouge; /* RGB */
color: #F00; /* HEX */
color: hsl(0, 100%, 50%); /* HSL */
```
### Background-Color
Définit la couleur de fond d'un élément CSS.
```
background-color: bleu;
```
### Font-Family
Définit la police utilisé pour un élément CSS.
```
font-family: Arial, sans-serif;
```
## Propriétés de mise en page et de positionnement
### Margin
Ajoute une marge autour d'un élément CSS.
```
margin: 20px; /* ajoute des marges de 10 pixels à droite, gauche, haut et bas */
margin: 10px 5px 20px 30px; /* ajoute des marges différentes aux côtés */
```
### Padding
Ajoute une zone d'emboîtement autour d'un élément CSS.
```
padding: 10px; /* ajoute des espaces de 5 pixels à droite, gauche, haut et bas */
padding: 5px 10px 20px 30px; /* ajoute des espaces différents aux côtés */
```
### Box-Sizing
Définit comment les marges, le padding et la largeur d'un élément sont calculées.
```
box-sizing: border-box; /* inclut la bordure dans la largeur total de l'élément */
```
### Width et Height
Définit la largeur et la hauteur d'un élément CSS respectivement.
```
width: 200px;
height: 150px;
```
## Propriétés de texte
### Text-Align
Définit l'alignement du texte dans un élément CSS.
```
text-align: center; /* centre */
text-align: left; /* gauche */
text-align: right; /* droite */
text-align: justify; /* justifie le texte */
```
### Text-Decoration
Ajoute des décorations au texte d'un élément CSS.
```
text-decoration: underline; /* soulignement */
text-decoration: overline; /* ligne horizontale */
text-decoration: line-through; /* trait de travers */
```
## Propriétés d'écriture et de lettres
### Text-Transform
Permet de convertir des caractères en majuscules ou minuscules.
```
text-transform: uppercase; /* majuscules */
text-transform: lowercase; /* minuscules */
```
### Letter-Spacing et Word-Spacing
Définit l'espacement entre lettres et mots respectivement.
```
letter-spacing: 1px; /* espacement entre lettres */
word-spacing: 1px; /* espacement entre mots */
```
### Text-Shadow
Ajoute une ombre au texte d'un élément CSS.
```
text-shadow: 2px 2px #ccc; /* ombre avec décalage et couleur */
```
## Propriétés de bordures
### Border
Ajoute des bords autour d'un élément CSS.
```
border: 1px solid rouge;
```
### Border-Radius
Ronde les coins d'un élément CSS.
```
border-radius: 5px;
```
## Propriétés de flexbox
### Display, Flex et Align-Items
Permet de créer des conteneurs flexibles et contrôler l'alignement de leurs enfants.
```
display: flex;
align-items: center; /* centre horizontal */
align-items: flex-start; /* alignement vertical au début */
align-items: flex-end; /* alignement vertical à la fin */
```
## Propriétés de positionnement et de floats
### Position, Left, Right, Top, Bottom
Permet de définir la position et les marges absolues d'un élément CSS.
```
position: absolute; /* élément positionné absolu */
left: 10px;
right: 20px;
top: 30px;
bottom: 40px;
```
### Clear
Empêcher les éléments flottants de perturber le positionnement des autres éléments.
```
clear: left; /* empêche un élément flottant de se chevaucher avec un autre à sa gauche */
clear: right; /* empêche un élément flottant de se chevaucher avec un autre à sa droite */
```
## Propriétés de transition et d'animation
### Transition
Permet de définir une durée pour les changements de propriété.
```
transition: all 0.5s; /* tout changement de propriété sur 0,5 seconde */
```
### Animation
Permet de créer des animations personnalisées pour des éléments CSS.
```
@keyframes example {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.example {
  animation: example 5s infinite; /* l'animation se répète 5 secondes */
}
```
