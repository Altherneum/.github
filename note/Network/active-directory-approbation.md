# AD enfant
- `Win22-SRV-4`
## Pré-configuration
- IP `192.168.10.12`
- Gate : `192.168.10.254`
- Changer le nom du PC
- Suffix DNS : `M2I.FORMATION.LAN`
## DNS
- Ajouter le rôle `DNS`
  - Puis `Outils`, `DNS`
- `Zone de recherche directe`, `Clique droit`, `Nouvelle zone`
  - `Zone principale`
  - `Directe`
  - `M2I.FORMATION.LAN`
- `Clique droit` sur le serveur `Win22-SRV-4`
  - `Propriétés`
  - Onglet `Redirecteurs`
  - Ajouter les deux serveurs Active Directory principaux : `192.168.10.10` et `192.168.10.11`
## AD DS
- Ajouter le rôle `AD DS`
- `Promotion en contrôleur de domaine`
- `Ajouter un nouveau domaine à une forêt existante`
  - Sélectionner le type du domaine : `Domaine enfant`
  - Nom du domaine parent : `FORMATION.LAN`
  - Nouveau nom du domaine : `M2I`
  - Connexion avec le compte : `FORMATION\Administrateur`, `Respons11`
  - NetBIOS : `M2I`
## Domaines et approbations
- Outils : `Domaines et approbations Active Directory`
  - `M2I.FORMATION.LAN` est visible

# AD enfant 2
- `Win22-SRV-5`
## Pré-configuration
- IP `192.168.10.13`
- Gate : `192.168.10.254`
- Changer le nom du PC
- Suffix DNS : `ETUDE.LOCAL`
## DNS
- Ajouter le rôle `DNS`
  - Puis `Outils`, `DNS`
- `Zone de recherche directe`, `Clique droit`, `Nouvelle zone`
  - `Zone principale`
  - `Directe`
  - `ETUDE.LOCAL`
- `Zone de recherche directe`, `Clique droit`, `Nouvelle zone`
  - `Zone de stub`
  - `FORMATION.LAN`
  - Ajouter les deux serveurs Active Directory principaux : `192.168.10.10` & `192.168.10.11`
### DNS Win22-SRV-1
- `Outils`, `DNS`
- `Zone de recherche directe`, `Clique droit`, `Nouvelle zone`
  - `Zone de stub`
  - `ETUDE.LOCAL`
  - Ajouter l'adresse IP de l'Active Directory `ETUDE.LOCAL` : `192.168.10.13`
## AD DS
- Ajouter le rôle `AD DS`
- `Promotion en contrôleur de domaine`
  - `Nouvelle forêt`
  - `ETUDE.LOCAL`
  - Connexion avec le compte : `Administrateur`, `Respons11`
  - `Décocher` `Mettre à jour la délégation DNS`
  - Nom NetBIOS  : `ETUDE`
## Domaine et approbation
- Outils : `Domaines et approbations Active Directory` 
- `Clique droit` sur `ETUDE.LOCAL`
- `Propriétés`
- Onglet `Approbations`
- `Nouvelle approbation`
  - `FORMATION.LAN`
  - `Approbation de forêt`
  - `Bidirectionnel`
  - `Ce domaine et le domaine spécifié`
  - Entrer l'Administrateur de `FORMATION.LAN` `FORMATION\Administrateur` et son mot de passe
  - `Authentification pour toutes les ressources de la forêt`
  - `Authentification pour toutes les ressources de la forêt`
  - `Oui, confirmer l'approbation sortante`
  - `Oui, confirmer l'approbation sortante`
## Vérification
- Créer un PC client dans le domaine `ETUDE.LOCAL`
  - Connectez vous à un utilisateur de `FORMATION.LAN` via `FORMATION\Utilisateur`
- Créer des ressources dans les domaine `ETUDE.LOCAL`
  - Utilisez les ressources d'`ETUDE.LOCAL` depuis `FORMATION.LAN`
- Les situations inverses sont possibles (Si l'approbation est bidirectionnel)