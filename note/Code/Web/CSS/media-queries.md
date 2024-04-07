
Ce cours vous aidera à maîtriser les __**Media Queries**__ CSS, une fonctionnalité permettant de __modifier le style de votre page web **en fonction des conditions telles que la taille de l'écran ou l'orientation**__.

# Les Media Queries CSS
## Qu'est-ce qu'une Media Query ?
Une Media Query est une règle CSS permettant de définir des styles pour différentes conditions telles que la largeur, la hauteur ou l'orientation de l'écran. Elle s'avère particulièrement utile lorsque vous souhaitez optimiser les affichages de votre site web sur différents appareils et réseaux.

---

## Pourquoi utiliser des Media Queries ?
Les Media Query permettent d'adapter le contenu et la mise en page de votre site web à différentes conditions, ce qui améliore l'expérience utilisateur. Elles sont particulièrement utiles lorsque vous souhaitez :

- Ajuster le layout pour des écrans de différentes tailles (par exemple, un design optimisé pour ordinateurs et un autre pour smartphones).
- Changer certains styles en fonction de l'orientation de l'écran (par exemple, afficher une image plein écran dans la version portrait et deux images côte à côte dans la version paysage).

---

## Syntaxe de base
```
@media screen and (min-width: 768px) {
  /* Code CSS à appliquer quand la condition est remplie */
}
```
Dans cet exemple, le code CSS entre les accolades s'applique uniquement si l'écran a une largeur minimale de `768px`.

---

## Exemple pratique : définir une largeur minimum d'écran
Supposons que vous souhaitez afficher un menu déroulant seulement quand l'écran a une largeur supérieure à `768px`. Vous pouvez utiliser la suivante règle CSS :
```
@media screen and (min-width: 768px) {
  nav ul {
    display: block; /* or inline-block, flex, grid... */
  }
}
```

---

## Exemple pratique : définir une largeur maximale d'écran
Supposons que vous souhaitez cacher certaines images lorsque l'écran a une largeur supérieure à `1024px` pour optimiser la vitesse de chargement. Vous pouvez utiliser la suivante règle CSS :
```
@media screen and (max-width: 1024px) {
  img.large {
    display: block; /* or inline-block, flex, grid... */
  }
}

@media screen and (min-width: 1025px) {
  img.large {
    display: none;
  }
}
```

---


## Exemple pratique : changer l'orientation de l'écran
Supposons que vous souhaitez afficher deux images côte à côte dans la version paysage et une image plein écran dans la version portrait. Vous pouvez utiliser les règles suivantes CSS :
```
@media screen and (orientation: landscape) {
  .image-container {
    display: flex;
  }
}

@media screen and (orientation: portrait) {
  .image-container img:first-child {
    width: 100%;
  }

  .image-container img:last-child {
    display: none;
  }
}
```
