# Active Directory
## Gestion du rôle AD DS
### Installer le rôle AD DS
- Sur le `Gestionnaire de serveur`
- `Gérer`, `Ajouter des rôles et fonctionnalités`
- Fonctionnalité `AD DS`
- Installer la fonctionnalité
- `Promouvoir ce serveur en contrôleur de domaine`

![Promotion en contrôleur de domaine](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_saelIxaPD4.png?raw=true)

### Supprimer le rôle AD DS
- Sur le `Gestionnaire de serveur`
- `Gérer`, `Supprimer des rôles et fonctionnalités`
- Décocher `AD DS`
- Bouton : `Supprimer`
- `Rétrograder le contrôleur de domaine`
- Cocher `Dernier contrôleur de doamine`
- Cocher `Supprimer les partitions d'applications` ainsi que `Supprimer la délégation DNS`
- Validez un `Nouveau mot de passe d'administrateur` pour la machine

### Ajouter une fôret
- Nom de domaine racine : `FORMATION.LAN`
- Version : `Windows Server 2016`
- Mot de passe : `Respons11`
- Ne pas `Créer de délégation DNS` ❌
- Nom de domaine NetBIOS : `FORMATION`

[voir fichier ad.txt](https://github.com/Altherneum/.github/blob/main/note/Network/ad.txt)

### Activer la corbeille active directory
- Dans le `Centre d'administration Active Directory`
- Clique droit sur le domaine `FORMATION (local)`
- `Activer la corbeille` (Action irreversible)  
Permet de récupérer des objets supprimés de l'Active Directory
- Sera dans `CN=Deleted Objects,DC=FORMATION,DC=LAN`  
ou `Centre d'administration Active Directory` > `FORMATION (Local)` > `Deleted objects`

## Configuration de l'Active Directory
- Liste des Ordinateurs, utilisateurs, domaines, groupes
### Unité d'organisation
- `UO` : `Unité d'organisation`
- Permet de trier / filtrer des groupes d'objets
- `Clique droit`, `Nouveau`, `Unité d'organisation`
- `Nom` : `@_FORMATION`  
(Permet d'être la première unité visible dans la liste)
- Dans `@_FORMATION`, créer l'UO `Utilisateurs`, `Ordinateurs`, `Groupes`, `Partages`
- Dans `Ordinateurs` `Utilisateurs` et `Groupes` créer l'UO `IT`
- Dans `Utilisateurs` créer l'UO `RH`

### Créer un utilisateur
- `Nordine` `HATEUR`  
- Login : `N123456789`  
- Password : `Azerty11`  
- Avec l'option : `L'utilisateur doit changer le mot de passe à la prochaine ouverture de session`)  
- Dans l'UO `Utilisateurs/IT`
#### Modifier ou supprimer
- `Affichage`, `Fonctionnalité avancé`, `Clique droit` sur l'objet à modifier / supprimer et `Propriétés`, catégorie `Objets`, décocher `Protéger l'objet des suppressions accidentelles`
#### Horaire d'accès
Option `Compte` des `Propriétés` de l'utilisateur, puis bouton `Horaire d'accès`
#### Désactiver un compte
##### Par date
Option `Compte` des `Propriétés` de l'utilisateur
##### Manuellement
`Clique droit` sur l'utilisateur, `Toutes les tâches`, `Désactiver le compte`
#### Se connecter à
- Bouton : `Se connecter à`  
Limite les ordinateurs sur le quel l'utilisateur peut se connecter
#### Profil
- `Scripts de démarrage` (Fond d'écran, lecteurs réseaux, ...)
- `Chemin de profil` Stocke sur le réseau son environnement en cas de changement de machine

### Groupe
Un nom de groupe doit être unique
#### Créer un groupe
- Dans `@_FORMATION`, `Groupe`, `IT`
- `Clique droit` sur l'unité d'organisation `IT`
- `Nouveau`, `Groupe`
- Nom du groupe : `G_IT_RW`  
[Globale](#Globale) IT, Read write
- Exemple 2 : `D_IT_RW`
[Domaine local](#Domaine-local) IT, Read write

#### Membres
- `Clique droit` sur le groupe
- `Propriétés` 
##### Ajouter des membres
- Onglet `Membres`
- Bouton `Ajouter`
- `Entrez le nom des objets à sélectionner`, ou sur le bouton `Avancé` puis `Rechercher`
##### Lier le groupe membre de ...
- Onglet `Membre de`
- Bouton `Ajouter`
- Ajouter un groupe au quel cette unité sera lié
#### Exemple membre vs membre de
Exemple avec le groupe `G_IT_RW` :
- `Membre de` l'unité `D_IT_RW`
- `Membre` : `Sarah`, `Nordine`, ...

#### Type de groupe
##### Sécurité
Ils permettent d’utiliser les groupes pour gérer les autorisations d’accès aux ressources

Par exemple, si vous avez un partage sur lequel vous souhaitez donner des autorisations d’accès, vous pourrez utiliser un « groupe de sécurité » pour donner des autorisations à tous les membres de ce groupe
##### Distribution
⚠ Information non checké  
Recevoir des messages
ces groupes sont utilisés principalement par des applications de messagerie, afin de créer une listes de distribution

#### Porté
![Portée des groupes](https://github.com/Altherneum/.github/blob/main/note/assets/AD-Group-Range.png?raw=true)
Utilisateur doit être forcément d'un `groupe globale` (sac à patate d'user)
Le `groupe globale` sera membre du `Domaine local`
##### Domaine local
Accès que au ressources locale de l'arbre

Un groupe qui dispose d’une étendue « domaine local » peut être utilisé uniquement dans le domaine dans lequel il est créé

Avec ce type d’étendue, le groupe reste local au domaine où il est créé

Cependant, les membres d’un groupe à étendue locale peuvent être bien sûr des utilisateurs, mais aussi d’autres groupes à étendues locales, globales ou universelles

##### Globale
Accès à la forêt de l'active directory

Un groupe ayant une étendue « globale » pourra être utilisé dans le domaine local, mais aussi dans tous les domaines approuvés par le domaine de base

Ainsi, si un « domaine A » approuve via une relation un « domaine B », alors un groupe global créé dans le « domaine A » pourra être utilisé dans le « domaine B »

##### Universelle
Accèssible dans l’ensemble de la forêt de l'Active Directory

Un groupe universel peut contenir des groupes et objets provenant de n’importe quel domaine de la forêt. 

De la même manière, il est possible de l’utiliser pour définir l’accès aux ressources sur tous les domaines de la forêt.

###### Précision des portées
- Comptabilité : étendue « domaine local » sur « paris.it-connect.local »
- Direction : étendue « globale » sur « learn-online.local » qui approuve tous les sous-domaines
- Informatique : étendue « universelle » sur la forêt

![Portée de groupe](https://github.com/Altherneum/.github/blob/main/note/assets/cours-active-directory-15.png?raw=true)

Si vous créez un groupe à étendue universelle, mais qu’il n’y a pas de relation avec un autre domaine ou une autre forêt, cela n’aura pas d’intérêt

# Partage de ressource
## Création des dossiers
- Dans le disque `C:/`
- `Nouveau dossier` nommé `@_Ressource`
- `Nouveau dossier` dans `@_Ressource` appelé `Services`
- `Clique droit` sur `Service` `Propriétés`
  - Retirer `Utilisateurs` (Qui définit tout les utilisateurs)
    - Casser l'héritage Propriétés, sécurité, `Avancé`, `Désactiver l'héritage`, `Convertir les autorisations héritées en autorisations explicites sur cet objet`
  - `Utilisateurs` peut-être maintenant retiré
- Nouveau dossier dans `Services` nommé `IT`
- Nouveau dossier dans `Services` nommé `RH`

## Permissions des dossiers
- Appliquer un groupe qui peut accéder à la ressource
- `Propriétés du dossier`, `sécurité`, `avancé`, `ajouter`, `Sélectionnez un principal`, taper le nom du groupe ou de l'utilisateur, `OK`, Appliquer les permission (`Lecture et exécution`, `Affichage du contenu du dossier`, `Lecture`, `Modification`)
- Le groupe `IT` Peut accéder au dossier `IT` et leurs sous fichiers (Read & write)
- Le groupe `RH` Peut accéder au dossier `RH` et leurs sous fichiers

## Permission du dossier
- Sur le dossier à partager
- Clique droit, `Propriétés`
- `Partage avancé`
- `Autorisation`
- `Tout le monde` : `Modifier` & `Lecture`

## Mise en partage des dossiers
- Dans l'option `Propriétés` du dossier, 
- Onglet `partage`, `Partage avancé`, 
- Valider l'option `Partager ce dossier`, 
- Il obtient un lien réseau à coller dans l'active directory (Exemple : `\\Win22-srv-1\it`)

## Option dossier cacher
- Un nom de partage avec `$` à la fin permet de cacher le dossier à ceux qui n'ont pas la permission de lecture

------------------------
**TO FILTER**

## Lier le partage au domaine
- Puis ajouter le partage dans l'Active Directory :
- `Clique droit` sur l'unitée d'organisation `Partage`
- `Nouveau`, `Dossier partagé`, taper le nom et coller le lien du partage crée depuis l'explorateur de fichier

## Partager une imprimante
Peut être fait aussi avec une imprimantes (Dans son propre dossier comme PC)

**TO FILTER**
------------------------

# Ajouter une machine dans le domaine
## Configuration IP
Voir [cours / enterprise-network #Adressage](https://doc.altherneum.fr/cours/enterprise-network.html#Adressage), et [cours / windows #Configuration-IP](https://doc.altherneum.fr/cours/windows.html#Configuration-IP)

## Renommer la machine
- `Explorateur de fichiers`
- `Propriétés`
- `Paramètre avancés du système`
- Onglet `Nom de l'ordinateur`
- `Modifier`
- Nom de l'ordinateur : `Win10-PC-1`
### Ajouter dans le domaine
- Membre d'un : `Domaine` : `FORMATION.LAN`  
- ⚠ Redémarrer la machine pour appliquer le poste dans le domaine
### Se connecter sur le domaine
- `.\Utilisateur` Permet de cibler le PC local
- `Nom du PC\Utilisateur` Cible le PC local en précisant le nom
- `Domaine\Utilisateur` Cible un domaine réseau
- `\\Domaine\Utilisateur` ???

# Stratégie de groupes
## Lecteur réseau
- `Gestionnaire de serveur`
- `Outils`, `gestion de stratégie de groupe`
- Dans `Formation.LAN` `@_FORMATION`, `Objet de stratégie`
- `Nouveau` `GPO_IT_U_Lecteur_Reseau`
- Sur la liste d'utilisateur `IT` clique droit `Lier un objet à une stratégie de groupe existant`, prendre la stratégie `GPO_IT_U_Lecteur_Reseau`, `OK`
### Modifier la stratégie de lecteur réseau
- `Clique droit` sur la stratégie, `Modifier`
- `Configuration Utilisateur` 
- `Préférences`
- `Paramètres Windows` `Mappages de lecteurs`
- `Clique droit`, `Nouveau` `Lecteur réseau mappé`
- Sélectionner l'`emplacement` du lecteur réseau déjà crée
- Appliquer une `Lettre de lecteur` : `S:`

### Vérifier la stratégie de lecteur réseau
- Se connecter sur le PC client
- Pour forcer ou mettre à jour la règle : commande `gpupdate /force`
- L'utilisateur peut créer ses dossiers / fichiers dans ce lecteur



- Penser à check si GPL et FDL sont partagés
## Installation de logiciel
### Déplacer le poste dans l'UO ordinateur
- `Gestionnaire serveur`
- `Outils`
- `Utilisateurs et ordinateurs Active Directory`
- Dans l'onglet `computers` le nouvel ordinateur est présent
- Déplacer l'ordinateur dans l'UO crée par le passé `Ordinateurs`/`IT`

### Créer la stratégie d'installation de logiciel
- Sur `Gestionnaire de stratégie de groupe`
- Sur `Ordinateurs`
- `Clique droit`
- `Créer un objet GPO dans ce domaine, et le lier ici`
- `GPO_ALL_O_GPL`
- `Clique droit` dessus `Modifier`
- `Ordinateur`
- `Stratégies`
- `Paramètres de logiciel`
- `Installation logiciel`
- `Clique droit`, `Nouveau`, `Package`
- Depuis un partage tel que `\\Win22-srv-1\gpl` (Le dossier doit être un partage réseau)
- Sélectionner les logiciels à partager
- `Ouvrir`
- Option `Attribué`
- Les packages vont se créer

### Vérifier la stratégie d'installation de logiciel
- Sur la machine concerné par la stratégie
- `gpupdate /force`
- Redémarrer la machine client
- La stratégie va installer les logiciels dans le package
 
### Mise à jour de package
- Pour update / modifier le package logiciel
- Clique droit dessus
- Modifier
- Onglet mise à niveau

## Stratégie de fond d'écran
- `Gestionnaire de stratégie de groupe`
- Sur `@Formation`
- `Créer un objet GPO dans ce domaine, et le lier ici`
- Nom :`GPO_UC_FDE+Connexion`
- `Clique droit`, `Appliqué`
- `Clique droit`, `modifier`
- `Utilisateur`, `stratégie`, `modèle d'administration`, `bureau`, `bureau`
- `Papier peint du bureau`
- `Activé`
- Nom du papier peint `\\Win22-srv-1\FDE\image.jpg`
- Style du papier peint : `étendue`

### Vérifier la stratégie de fond d'écran
- Retourner sur la machine locale
- `gpupdate /force`
- Relancer la machine
- Le fond d'écran est actif