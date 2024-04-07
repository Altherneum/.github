Sur ce guide on va vous expliquer le CSS

La feuille de style **CSS** (__**Cascading Style Sheets**__) permet d'améliorer la vue visuelle de leur site Web. Nous aborderons diverses techniques et concepts clés, allant des selecteurs de base aux animations et transitions.

- **1994** : Le W3C publie les spécifications CSS Level 0.
- **1996** : Apparition du CSS Level 1, qui ajoute des fonctionnalités telles que la mise en page et l'utilisation de classes.
- **2001** : CSS Level 2 est publié, introduisant des nouveaux types de sélecteurs, des propriétés pour les tables, et des méthodes de positionnement plus avancées.
- **2005** : Arrivée du CSS Level 3 avec des fonctionnalités supplémentaires telles que les animations, les transitions, et les effets graphiques.
- **2011** : La version CSS Level 4 est en cours de développement, apportant des améliorations dans plusieurs domaines tels que les feuilles de style à inclusion, les feuilles de styles modulaires, et des fonctionnalités plus avancées pour les médias.

---

# **Syntaxe**
Choisir des éléments HTML à traiter à l'aide d'un type d'élément HTML, et y attribuer une propriété
```
  body {
    background-color: red;
  }
  footer {
    font-size: 2em;
  }
  p, h1 {
    color: red;
  }
```

---

## **Sélecteur**
Choisir des éléments HTML à traiter à l'aide d'un identificateur ou une classe.
```
  .maClass {
    color: red;
  }
  #monId {
    font-size: 2em;
  }
```
- **un id** s'applique à __un objet unique__ : il ne peut pas y avoir deux mêmes id dans une page
- **une classe** peut caractériser __plusieurs objets__ (identiques ou non)

---

## **Propriétés**
Changer l'aspect visuel des éléments sélectionnés.
```
.maClass {
  color: red;
  font-size: 1.5em;
  text-align: center;
}
```

---

## **Animations et Transitions**
Ajouter une transition entre deux états visuels.
```
.maClass {
  animation: my-animation 2s ease;
}
@keyframes my-animation {
  0%   { transform: translateX(0); }
  50%  { transform: translateX(20px); }
  100% { transform: translateX(40px); }
}
```

---

### **Transition**
Faire une transition douce lors d'un événement.
```
.maClass:hover {
  background-color: blue;
  transition: background-color 1s ease;
}
```

---

## Sélecteurs Multiples
Les sélecteurs multiples permettent de s'adresser à plusieurs éléments HTML à la fois. Cela peut être utile pour appliquer des styles similaires à des éléments qui ont une structure semblable dans le HTML.
```
li, p, a, 
h2, h3 {
  color: blue;
}
```

---

## Sélecteurs Pseudo-classes
Les sélecteurs avec les symboles de pseudo-classes :: permettent d'appliquer des styles à des états particuliers de nos éléments. Par exemple, nous pouvons utiliser le hover pour les pointeurs du curseur, active lorsqu'un élément est actif ou focus pour des champs d'entrée.
```
a:hover {
  color: red;
}
input[type="text"]:focus {
  border: 2px solid blue;
}
button:active {
  background-color: grey;
}
```
