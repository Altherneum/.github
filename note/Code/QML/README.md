# QML : La Documentation Complète pour Débutants
## Qu'est-ce que QML ?
- **Définition:** QML (Qt Modeling Language) est un langage de description de l’interface utilisateur (UI)
- Il permet de créer des interfaces graphiques riches et dynamiques, en se concentrant sur la *modélisation* des données et leur présentation visuelle
- **Ce que ça sert :** QML est utilisé pour développer des applications graphiques multiplateformes avec Qt
- Il est particulièrement adapté aux interfaces utilisateur complexes, interactives et réactives
- **Date de création:** QML a été créé par Nokia en 2010 et intégré à Qt en 2011
- Il a ensuite été largement adopté par la communauté Qt pour créer des interfaces utilisateur modernes et performantes

## Histoire de QML
- **Né d'un besoin :** Avant QML, les développeurs devaient écrire du code C++ pour chaque élément de l’interface utilisateur
  - Cela était long, complexe et difficile à maintenir
- **L'idée de Nokia :** Nokia a identifié ce problème et a créé QML comme une solution plus simple et intuitive
  - L'objectif était de permettre aux concepteurs et développeurs de se concentrer sur la conception de l’interface utilisateur sans avoir à s'occuper des détails de bas niveau du code C++
- **Intégration dans Qt :**  Qt a rapidement adopté QML, le considérant comme un élément clé pour son développement
  - Cela a permis à Qt de devenir une plateforme de développement multiplateforme très populaire pour les applications graphiques

## Cours pour Novices : Créer Votre Premier Fichier QML
### Création du fichier
- **Créez un nouveau fichier:** Avec l'extension `.qml` Par exemple, `MyFirstApp.qml`
- **Utilisez un éditeur de texte:** Visual Studio Code, Qt Creator, etc pour écrire votre code QML

### Lancer un fichier QML
- **Qt Creator :** La méthode la plus simple est d'ouvrir le fichier `.qml` dans Qt Creator Il s’occupera automatiquement du lancement de l'application
- **Ligne de commande :** Vous pouvez lancer une application QML depuis la ligne de commande en utilisant `qmlscene` Par exemple: `qmlscene MyFirstApp.qml`
  - Ou via `qs -p ~/repo/QuickShell/MyFirstApp.qml`

### Créer les débuts du fichier (variables, éléments)
```qml
import QtQuick 2.15  // Importe le module QtQuick essentiel

Rectangle {
    width: 300
    height: 200
    color: "lightgray" // Couleur de fond

    Text {
        text: "Hello, QML!"
        anchors.centerIn: parent // Centre le texte dans le Rectangle
    }
}
```

**Explication du code :**
- `import QtQuick 2.15`:  Indique que vous utilisez le module QtQuick pour créer l'interface utilisateur La version 2.15 est la plus récente à ce jour
- `Rectangle { ... }`: Définit un rectangle, qui est un élément de base dans QML
    - `width: 300`, `height: 200`:  Définit la largeur et la hauteur du rectangle
    - `color: "lightgray"`: Définit la couleur de remplissage du rectangle
- `Text { ... }`: Définit un élément texte
    - `text: "Hello, QML!"`: Définit le texte à afficher
    - `anchors.centerIn: parent`:  Positionne l'élément texte au centre du rectangle

## Concepts Clés de QML
- **Éléments:** Les éléments sont les blocs de construction fondamentaux d'une interface utilisateur QML
  - Ils peuvent être des rectangles, des textes, des boutons, des images, etc
- **Propriétés:** Chaque élément a des propriétés qui définissent son apparence et son comportement (couleur, taille, position, texte, etc)
- **Modèles de données:** QML est conçu pour la modélisation des données
  - Vous pouvez définir des objets JavaScript ou utiliser des modèles QML pour stocker et manipuler les données de votre interface utilisateur
- **Signaux et Slots :** Permettent aux éléments d'interagir entre eux en émettant des signaux (événements) et en répondant à ces signaux via des slots

## Documentation Officielle
- **Qt Quick Reference** : [doc.qt.io/qml-quick/index.html](https://doc.qt.io/qml-quick/index.html)
- **Qt QML Language Specification** : [https://doc.qt.io/qml-language/index.html](https://doc.qt.io/qml-language/index.html)
- **Qt Quick Tutorials** : [doc.qt.io/qtquick-tutorials/index.html](https://doc.qt.io/qtquick-tutorials/index.html)
- **Qt modules**  :[doc.qt.io/qt-6/qt-additional-modules.html](https://doc.qt.io/qt-6/qt-additional-modules.html)

# Notes
- Utilisez Qt Creator : L'IDE Qt Creator offre un excellent support pour QML, y compris la coloration syntaxique, l'autocomplétion et le débogage