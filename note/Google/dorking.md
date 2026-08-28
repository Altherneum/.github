# Définition

Les Google Dorks, également connus sous le nom de "Google Hacks" ou de "trucs de recherche de moteur de recherche", sont des requêtes de recherche avancées conçues pour récupérer des informations cachées, spécifiques ou non indexées que les recherches Google standard ne découvrent pas. Ce procédé peut être utilisé à des fins légitimes telles que la recherche de données, le test de sécurité ou l'enquête journalistique. Toutefois, il est important d'utiliser cette puissance de manière responsable et de respecter les lois sur la vie privée et les droits de copie.

## Alternative Brave
[search.brave.com/help/operators](https://search.brave.com/help/operators)

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
  - Par exemple : au début `* à rechercher`  
  - Par exemple : au milieu `mots * rechercher`  
  - Par exemple : à la fin `mots à *`  
  - Par exemple : plusieurs mots `* rechercher`
- `site:` Limite les résultats à un domaine spécifique  
  - Par exemple : `site:example.com mots à rechercher`
- `intitle:` Limite les résultats aux pages dont le titre contient une expression donnée  
  - Par exemple : `intitle:Titre mots à rechercher`
- `inurl:` Cherche le terme entre parentès dans l'URL de la page
  - Par exemple : `inurl:/folder/mots_à_rechercher`
- `filetype:` Limite les résultats à un type de fichier  
  - Par exemple : `filetype:pdf mots à rechercher`
- `before:` Affiche les résultats qui contiennent une expression avant une date donnée  
  - Par exemple : `mots à rechercher:date`
- `define:` Retourne la définition d'une expression  
  - Par exemple : `define:mots à définir`
- `intext:` Recherche du texte sur la page
  - Par exemple : `intext:"erreur"`
- `link:` Trouve les pages qui lient vers une URL donnée
  - Par exemple : `link:example.com`
- `related:` Pages similaires à un site donné
  - Par exemple : `related:example.com`
- `cache:` Affiche la version mise en cache d'une page
  - Par exemple : `cache:example.com`
- `info:` Récupère des informations sur le domaine
  - Par exemple : `info:example.com`
- `allintitle:` Toutes les expressions dans le titre
  - Par exemple : `allintitle:"data breach"`
- `allinurl:` Toutes les expressions dans l'URL
  - Par exemple : `allinurl:"admin panel"`
- `numrange:` Recherche de plage numérique
  - Par exemple : `numrange:1000..2000`
- `daterange:` Recherche par plage de dates
  - Par exemple : `daterange:20200101..20201231`

### Exemple
#### Github.com & token & .yml
- [google.com/search?q=site:github.com+token+filetype:yml](https://www.google.com/search?q=site:github.com+token+filetype:pdf)  
Recherche sur le site Github.com et des fichiers YML contenant le mot "token"
#### Github.com & .pdf
- [google.com/search?q=site:github.com+filetype:pdf](https://www.google.com/search?q=site:github.com+filetype:pdf)  
Recherche sur le site Github.com et des fichiers PDF
![image Google dork](https://github.com/Altherneum/.github/blob/main/note/assets/images/google-dork.png?raw=true)
#### Mediafire.com/file/
- [google.com/search?q=site:mediafire.com/file/](https://google.com/search?q=site:mediafire.com/file/)
#### Drive.Google.com
##### Drive.Google.com/file
[google.com/search?q=site:drive.google.com/file/](https://www.google.com/search?q=site:drive.google.com/file/)
###### Drive.Google.com/file .pdf
[google.com/search?q=site:drive.google.com/file/ ".pdf"](https://www.google.com/search?q=site:drive.google.com/file/+".pdf")
###### Drive.Google.com/file .mp4
[google.com/search?q=site:drive.google.com/file/ ".mp4"](https://www.google.com/search?q=site:drive.google.com/file/+".mp4")
###### Drive.Google.com/file .png
[google.com/search?q=site:drive.google.com/file/ ".png"](https://www.google.com/search?q=site:drive.google.com/file/+".png")
##### Drive.Google.com/drive/folders
[google.com/search?q=site:drive.google.com/drive/folders](https://www.google.com/search?q=site:drive.google.com/drive/folders)
#### Gitlab.com & password & .env
- [google.com/search?q=site:gitlab.com+password+filetype:env](https://www.google.com/search?q=site:gitlab.com+password+filetype:env)  
Recherche sur le site GitLab.com et des fichiers .env contenant le mot "password"
#### Pastebin.com & api_key
- [google.com/search?q=site:pastebin.com+api_key](https://www.google.com/search?q=site:pastebin.com+api_key)  
Recherche sur Pastebin.com pour les snippets contenant "api_key"
#### Bitbucket.org & credentials & .json
- [google.com/search?q=site:bitbucket.org+credentials+filetype:json](https://www.google.com/search?q=site:bitbucket.org+credentials+filetype:json)  
Recherche sur Bitbucket.org pour les fichiers JSON contenant "credentials"
#### Stack Overflow & \"Stack Overflow用户\" + sql
- [google.com/search?q=site:stackoverflow.com+\"Stack%20Overflow%E7%94%A8%E6%88%B7\"+sql](https://www.google.com/search?q=site:stackoverflow.com+\"Stack%20Overflow%E7%94%A8%E6%88%B7\"+sql)  
Recherche sur Stack Overflow en chinois pour les questions SQL
#### site:.gov + filetype:pdf + budget
- [google.com/search?q=site:.gov+filetype:pdf+budget](https://www.google.com/search?q=site:.gov+filetype:pdf+budget)  
Recherche de rapports budgétaires PDF sur les sites gouvernementaux
#### site:linkedin.com/in + \"Chief Information Officer\"
- [google.com/search?q=site:linkedin.com/in+\"Chief%20Information%20Officer\"](https://www.google.com/search?q=site:linkedin.com/in+\"Chief%20Information%20Officer\")  
Recherche de profils LinkedIn pour les CIO
#### site:wikipedia.org + intext:\"climate change\"
- [google.com/search?q=site:wikipedia.org+intext:%22climate%20change%22](https://www.google.com/search?q=site:wikipedia.org+intext:%22climate%20change%22)  
Recherche d'articles Wikipedia sur le changement climatique
#### filetype:log + error
- [google.com/search?q=filetype:log+error](https://www.google.com/search?q=filetype:log+error)  
Recherche de fichiers log contenant l'erreur
#### site:github.com + intitle:\"index of\" + src + filetype:js
- [google.com/search?q=site:github.com+intitle:%22index%20of%22+src+filetype:js](https://www.google.com/search?q=site:github.com+intitle:%22index%20of%22+src+filetype:js)  
Recherche de répertoires index contenant du JavaScript

## Outils et Ressources
De nombreux outils et ressources peuvent vous aider à construire des requêtes de Google Dork efficaces. Quelques-uns des plus populaires incluent :

- `Base de données Google Dorks`: Un répertoire exhaustif de requêtes de Google Dork préconstruites
~~[gogedork.com](https://www.gogedork.com/)~~ DNS_PROBE_FINISHED_NXDOMAIN

- `Shodan`: Une base de données ouverte pour appareils connectés à Internet, fréquemment utilisée avec Google Dorks pour étendre les résultats de recherche
[shodan.io](https://www.shodan.io/)

![image Shodan](https://github.com/Altherneum/.github/blob/main/note/assets/images/Shodan.png?raw=true)

- `Grapher`: Une outil pour visualiser et analyser les résultats de requête Google Dork
~~[github.com/qazbnm456/Grapher](https://github.com/qazbnm456/Grapher)~~ 404

# Utilisation de manière éthique

Le Google Dorking peut être un outil puissant, mais il est important d'en utilisateur de manière responsable et éthique. Quelques règles incluent :

- Utilisez les Google Dorks uniquement à des fins légitimes.
- Respectez la vie privée et les renseignements confidentiels. N'essayez pas d'accéder aux données sensibles sans l'autorisation appropriée ou des bases juridiques suffisantes.
- Suivez les lois sur le droit d'auteur, et évitez d'utiliser Google Dorks pour télécharger ou distribuer du matériel protégé par le droit d'auteur.
- Soyez conscients des risques potentiels, tels que des sites de phishing ou des pages infectées par du malware. Utilisez la prudence lorsque vous cliquez sur des liens d'origines inconnues.
- Préservez vos recherches dans les limites légales. N'utilisez pas Google Dorks pour des activités qui violent des lois locales, nationales ou internationales.
