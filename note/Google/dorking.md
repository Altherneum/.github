# Définition

Les Google Dorks, également connus sous le nom de "Google Hacks" ou de "trucs de recherche de moteur de recherche", sont des requêtes de recherche avancées conçues pour récupérer des informations cachées, spécifiques ou non indexées que les recherches Google standard ne découvrent pas. Ce procédé peut être utilisé à des fins légitimes telles que la recherche de données, le test de sécurité ou l'enquête journalistique. Toutefois, il est important d'utiliser cette puissance de manière responsable et de respecter les lois sur la vie privée et les droits de copie.

## Google Search Operators

Les opérateurs de recherche de Google sont des symboles ou textes ajoutés à une requête pour modifier les résultats de la recherche. Voici une liste non exhaustive de certains opérateurs :

- `OR` Permet de rechercher plusieurs mots ou expressions dans une même recherche  
Par exemple : `pomme OR banane`
- `AND` Permet de rechercher deux mots ou expressions ensemble  
Par exemple : `pomme AND tarte`
- `NOT` Permet d'exclure un mot ou expression des résultats de la recherche  
Par exemple : `pomme NOT banane`
- `"` Permet de rechercher une phrase précise `"appel pour le secours"`
- `*` Permet de rechercher plusieurs mots  
Par exemple : au début `* à rechercher`  
Par exemple : au milieu `mots * rechercher`  
Par exemple : à la fin `mots à *`  
Par exemple : plusieurs mots `* rechercher`
- `site:` Limite les résultats à un domaine spécifique  
Par exemple : `site:example.com mots à rechercher`
- `intitle:` Limite les résultats aux pages dont le titre contient une expression donnée  
Par exemple : `intitle:Titre mots à rechercher`
- `inurl:` Cherche le terme entre parentès dans l'URL de la page.  
Par exemple : `inurl:/folder/mots_à_rechercher`
- `filetype:` Limite les résultats à un type de fichier  
Par exemple : `filetype:pdf mots à rechercher`
- `before:` Affiche les résultats qui contiennent une expression avant une date donnée  
Par exemple : `mots à rechercher:date`
- `define:` Retourne la définition d'une expression  
Par exemple : `define:mots à définir`

### Exemple
- [google.com/search?q=site:github.com+token+filetype:yml](https://www.google.com/search?q=site:github.com+token+filetype:pdf)  
Recherche sur le site Github.com et des fichiers YML contenant le mot "token"
- [google.com/search?q=site:github.com+filetype:pdf](https://www.google.com/search?q=site:github.com+filetype:pdf)  
Recherche sur le site Github.com et des fichiers PDF

![Google](https://github.com/Altherneum/.github/assets/84735589/db1f3fc2-71a1-4bc3-b31a-7fb409faf1d6)

## Outils et Ressources

De nombreux outils et ressources peuvent vous aider à construire des requêtes de Google Dork efficaces. Quelques-uns des plus populaires incluent :

- `Base de données Google Dorks`: Un répertoire exhaustif de requêtes de Google Dork préconstruites.  
~~[gogedork.com](https://www.gogedork.com/)~~ DNS_PROBE_FINISHED_NXDOMAIN

- `Shodan`: Une base de données ouverte pour appareils connectés à Internet, fréquemment utilisée avec Google Dorks pour étendre les résultats de recherche.  
[shodan.io](https://www.shodan.io/)

![chrome_dBMhgWpLBV](https://github.com/Altherneum/.github/assets/84735589/ff9b34ba-44e4-4769-a5cc-10e21d509de2)

- `Grapher`: Une outil pour visualiser et analyser les résultats de requête Google Dork.  
~~[github.com/qazbnm456/Grapher](https://github.com/qazbnm456/Grapher)~~ 404

# Utilisation de manière éthique

Le Google Dorking peut être un outil puissant, mais il est important d'en utilisateur de manière responsable et éthique. Quelques règles incluent :

- Utilisez les Google Dorks uniquement à des fins légitimes.
- Respectez la vie privée et les renseignements confidentiels. N'essayez pas d'accéder aux données sensibles sans l'autorisation appropriée ou des bases juridiques suffisantes.
- Suivez les lois sur le droit d'auteur, et évitez d'utiliser Google Dorks pour télécharger ou distribuer du matériel protégé par le droit d'auteur.
- Soyez conscients des risques potentiels, tels que des sites de phishing ou des pages infectées par du malware. Utilisez la prudence lorsque vous cliquez sur des liens d'origines inconnues.
- Préservez vos recherches dans les limites légales. N'utilisez pas Google Dorks pour des activités qui violent des lois locales, nationales ou internationales.
