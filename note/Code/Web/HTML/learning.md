Sur ce guide on va vous expliquer le HTML  

HTML (**Hypertext Markup Language** ; "langage de balisage d’hypertexte") dans sa dernière version "HTML5", est le langage de **balisage** conçu pour représenter et structurer [sémantiquement](https://fr.wikipedia.org/wiki/Sémantique) une page web.  

Il est souvent utilisé conjointement avec le langage de programmation [JavaScript](https://fr.wikipedia.org/wiki/JavaScript) et des [feuilles de style en cascade](https://fr.wikipedia.org/wiki/Feuilles_de_style_en_cascade) (CSS).  

HTML est inspiré du [Standard Generalized Markup Language](https://fr.wikipedia.org/wiki/Standard_Generalized_Markup_Language) (SGML). Il s'agit d'un format ouvert.

**Développé par**	[World Wide Web Consortium](https://fr.wikipedia.org/wiki/World_Wide_Web_Consortium) "W3C" & [WHATWG](https://fr.wikipedia.org/wiki/Web_Hypertext_Application_Technology_Working_Group)
- 1989-1992 : Origine
- 1993 : Apports de [NCSA Mosaic](https://fr.wikipedia.org/wiki/NCSA_Mosaic)
- 1994 : Apports de [Netscape Navigator](https://fr.wikipedia.org/wiki/Netscape_Navigator)
- 1995-1996 : HTML 2.0
- 1997 : HTML 3.2 et 4.0
- 2000-2006 : [XHTML](https://fr.wikipedia.org/wiki/Extensible_Hypertext_Markup_Language)
- De 2007 à nos jours : HTML 5 et abandon du XHTML 2

# Syntaxe de HTML ✨

```
<TITLE>Exemple de titre</TITLE>
<p>Ceci est une phrase avec un <a HREF="cible.html">hyperlien</a>.</p>
<p>Ceci est un paragraphe sans hyperlien.</p>
<!-- Commentaire non visible -->
<pre> AB   C (permet de conserver les espaces)</pre>
```

## Explication
Cet exemple contient du texte, cinq balises et une référence d’entité :
- `TITLE` est la balise ouvrante de l’élément TITLE. `/TITLE` est la balise fermante de l’élément TITLE. `Exemple de HTML` est le contenu de l’élément TITLE.
- `A HREF="cible.html"` est la balise ouvrante de l’élément A, avec : `HREF=cible.html`, l’attribut HREF dont la valeur est cible.html (le lien).
- `P` est la balise ouvrante de l’élément text. Toutefois, elle est utilisée ici comme s’il s’agissait d’un séparateur de paragraphe, et c’est même ainsi qu’elle est souvent présentée dans les plus anciennes documentations de HTML. Il s’agit de la balise ouvrante du paragraphe dont le contenu est Ceci est un paragraphe où; il n’y a pas d’hyperlien. La balise fermante de l’élément P, qui est optionnelle, est ici omise. L’élément P est implicitement terminé lorsqu’un nouveau paragraphe commence ou que l’élément parent est fermé (cas non présent).
- Les balises peuvent être indifféremment écrites en minuscules ou majuscules. L’usage des minuscules devient plus courant car XHTML les impose.
- `< !-- {CODE OU COMMENTAIRE} -- >` est la balise "commentaire" et permet de ne pas exécuter de code ou de laisser une note
- `pre` représente du texte préformaté, généralement écrit avec une police à chasse fixe. Le texte est affiché tel quel, les espaces utilisés dans le document HTML seront retranscrits

## Consulter le code d'une page 🔬

![290289212-096b576d-3f49-4761-a132-7963769e28b4](https://github.com/Altherneum/.github/assets/84735589/cdcde52d-be28-4d6c-ae6b-d3eca9213c8a)

(Menu "clique droit" sur Chrome v.100+)

[view-source:](view-source:https://doc.Altherneum.fr/cours/html) (Peut être bloqué car il n'est pas censé être utilisé depuis une page web comme lien)  

- Ce lien permet de charger le **code source d'une page** (de la même façon que vous la créerez)
- Ouvrez le via "clique droit", puis "Afficher le code source"
- Vous retourne le fichier de base permettant de charger ce site

![HTML source](/note/assets/images/HTML-source.png)

Vous pouvez aussi **inspecter et modifier le code en direct** avec un **clique droit sur la page** (A.K.A "**DevTools**")  

- Il peut changer en fonction de votre navigateur
- Ouvrez le via un "clique droit" et "inspecter"
- Celui là permet de voir et modifier le code du site en temps réel

![HTML-devTool](/note/assets/images/HTML-devTool.png)

# Définition d'un élément HTML

[MDN Qu'est ce qu'un élément HTML](https://developer.mozilla.org/fr/docs/Glossary/Element)

![image d'un élément HTML](https://developer.mozilla.org/fr/docs/Glossary/Element/anatomy-of-an-html-element.png)

Exemple d'un élément text **P** avec une class "nice" (Pour appliquer des styles ou sélecteur de code) et comme contenu (et donc text) "Hello world!"

## Documentation

- __**Liste glossaire des éléments**__ [sur le MDN Mozilla](https://developer.mozilla.org/fr/docs/Glossary/Element) "mozilla developer network"
- Doc [MDN des éléments HTML](https://developer.mozilla.org/fr/docs/Web/HTML/Element)

## Exemples de page HTML

- La page que vous consultez : [Code](https://github.com/Altherneum/Altherneum.github.io/blob/main/cours/html.html) (pré-charge les pages)
- Le corps de la page "Chiffrement de César" : [Code](https://github.com/Altherneum/Altherneum.github.io/blob/main/src/html/content/caesar.html) (chargé via JS), [Page web](https://doc.Altherneum.fr/outils/caesar.html)
- Le Header avec les liens : [Code](https://github.com/Altherneum/Altherneum.github.io/blob/main/src/html/include/header.html) (chargé via JS sur les pages requises)
