# Stratégie de groupes
## Lecteur réseau
- `Gestionnaire de serveur`
- `Outils`, `gestion de stratégie de groupe`
- Dans `Formation.LAN`, `@_FORMATION`, `Objet de stratégie`
  - `Clique droit`, `Nouveau`, Nom : `GPO_IT_U_Lecteur_Reseau`
- Sur `Formation.LAN`, `@_FORMATION`, `Utilisateurs`, `IT`
  - `Clique droit`, `Lier un objet à une stratégie de groupe existant`, prendre la stratégie `GPO_IT_U_Lecteur_Reseau`, `OK`

- Créer la stratégie dans : `Formation.LAN` `@_FORMATION`, `Objet de stratégie` est identique à `Formation.LAN`, `@_FORMATION`, `Utilisateurs`, `IT` si elle est liée par la suite à l'objet

- Créer la stratégie sur un groupe ne fonctionnera pas
  - Cette stratégie doit être appliquée sur un utilisateur ou une UO contenant des utilisateurs
  - Vous devrez sinon créer un [# ciblage](#Ciblage) sur le groupe en question

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

## Ciblage
- [IT connect](https://www.it-connect.fr/comment-monter-un-lecteur-reseau-par-gpo/)
- To do ...

## Installation de logiciel
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

### Déplacer le poste dans l'unité d'organisation ordinateur
- `Gestionnaire serveur`
- `Outils`
- `Utilisateurs et ordinateurs Active Directory`
- Dans l'onglet `computers` le nouvel ordinateur est présent
- Déplacer l'ordinateur dans l'UO crée par le passé `Ordinateurs`/`IT`

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
- `Clique droit`, `Modifier`
- `Utilisateur`, `Stratégie`, `Modèle d'administration`, `Bureau`, `Bureau`
- `Papier peint du bureau`
- Option `Activé`
- Nom du papier peint `\\Win22-srv-1\FDE\Altherneum.jpg`
- Style du papier peint : `étendue`

## Stratégie de fond d'écran de verouillage
- Sur la même stratégie
- `Ordinateur`
- `Stratégie`
- `Modèle d'administration`
- `Panneau de configuration`
- `Personnalisation`
- `Forcer une image de l'écran de verrouillage et d'ouverture de session par défaut spécifique`
- `Chemin d'accès de l'image de l'écran de verrouillage` : `\\Win22-srv-1\FDE\Altherneum.jpg`

## Stratégie de fond vérouillé
- Sur la même stratégie
- `Ordinateur`
- `Stratégie`
- `Modèle d'administration`
- `Panneau de configuration`
- `Personnalisation`
- `Empêcher la modification de l'image de l'écran de verrouillage et d'ouverture de session`
- `Activé`

### Vérifier la stratégie de fond d'écran
- Retourner sur la machine locale
- `gpupdate /force`
- Relancer la machine
- Le fond d'écran est actif

## Stratégie shutdown à 20H
- Créer une GPO sur l'UO `Ordinateurs`
  - Nommer la GPO `C_Shutdown_20H`
- `Clique droit` sur la GPO : `Modifier`
  - `Configuration ordinateur`
  - `Préférences`
  - `Paramètres du panneau de configuration`
  - `Tâches planifiées`
- `Clique droit`, `Nouveau`, `Tâche planifiée (au minimum Windows 7)`
  - `Nom` : `Shutdown_20H`
  - `Lors de l'exécution de la tâche, utilisez le compte d'utilisateur suivant` : `Système`
- Onglet : `Action`, `Nouveau`
  - `Programme / script` : `C:\Windows\System32\shutdown.exe`
  - `Ajouter arguments` : `-s -t 0 -f` (Fermeture forcé des applications) 
  - Ou l'`Arguments` : `-s -t 0 -soft` (Fermeture douce des applications)
- Onglet `Déclancheur`, `Nouveau`
  - `Tout les jours` : `20H 00m 00s`
## Vérifier la GPO shutdown
- `gpupdate /force && shutdown -r -t 0` pour appliquer la GPO et relancer la machine
- `Planificateur de tâches` en tant qu'administrateur
  - `Bibliothèque du Planificateur de tâches`

## Stratégie Password Policy
- Créer une GPO sur l'UO `@_FORMATION`
  - Nommer la GPO `GPO_C_Password`
- `Clique droit` sur la GPO : `Modifier`
- `Configuration ordinateur`
  - `Stratégies`
  - `Paramètres Windows`
  - `Paramètres de sécurité`
  - `Stratégie de comptes`
  - `Stratégie de mot de passe`, ainsi que `Stratégie de verrouillage du compte`
### Stratégie de mot de passe
- `Longueur minimale du mot de passe` : `14`
- `Le mot de passe doit respecter des exigences de complexité` : [X]
- `Durée de vie maximale du mot de passe` : `30`
- `Durée de vie minimale du mot de passe` : `1`
### Stratégie de verrouillage du compte
- `Durée de verrouillage des comptes` : `30` minutes
- `Réinitialiser le compteur de verouillages du compte après` : `30` minutes
- `Seuil de verrouillage du compte` : `5`

## FireWall forcé
- Créer une GPO sur l'UO `Ordinateurs`
  - Nommer la GPO `GPO_C_Firewall`
- `Clique droit` sur la GPO : `Modifier`
- `Configuration ordinateur`
- `Stratégies`
- `Modèles d'administration`
- `Réseau`
- `Connexions réseau`
- `Pare-feu Windows Defender`
- `Profil du domaine`
- `Pare-feu Windows Defender : Protéger toutes les connexions réseau` : `Activer`


# To Do
## Block software install
- [IT-connect](https://www.it-connect.fr/gpo-comment-empecher-les-utilisateurs-dexecuter-certains-logiciels/)

## Block shell & .BAT
- ....