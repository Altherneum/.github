# Alias
## Configurer les alias
### Alias personnel
#### Alias via .bash_aliases
- Dans le dossier `/home/[USER]`, créer le fichier `.bash_aliases` 
  - Ajoutez y directement les alias
- Vérifier la présence du chargement des alias dans le fichier `.bashrc` (~L.100)

#### Alias via .bashrc
- Dans le dossier `/home/[USER]`, modifier le fichier `.bashrc`
  - Après la ligne `# some more ls aliases`

### Alias global de connexion
- Dans le dossier `/etc/profile.d`, créez le fichier `[NOM].sh`
  - Exemple : `alias_custom.sh`
- Ajoutez `00` devant le nom du fichier `.sh` si vous souhaitez qu'il soit chargé en premier avant d'autres fichiers pouvant utiliser ces alias
  - Exemple : `00_alias_custom.sh`

- Le shell **__doit être lancé en tant que shell de connexion__** !

### Alias global complet
- Dans le dossier `/etc/profile.d`, créez le fichier `[NOM]`
  - Exemple : `alias_custom`
- Ajoutez `00` devant le nom du fichier si vous souhaitez qu'il soit chargé en premier avant d'autres fichiers pouvant utiliser ces alias
  - Exemple : `00_alias_custom`

- Ajoutez dans `/etc/bash.bashrc` : `source [FICHIER]`

### Créer les alias
- Ajoutez les alias de la manière suivante : `alias [CMD_ALIAS]='[CMD]'`
  - Exemple : `alias lsa='ls -a'`

### Activez les alias
- Rechargez le terminal
- Ou utilisez la commande `source [FICHIER]` pour directement les charger sans relancer
  - Exemple : `source .bash_aliases`

## Exemple d'alias
```
alias c='clear'
alias cls='clear'
alias h='history'
alias ll='ls -lh'
alias lsa='ls -a'
alias cx='chmod u+x'
```

## Alias temporaires
### Créer un alias temporaire
- Vous pouvez simplement utiliser la commande pour [créer des alias](#Créer-les-alias), une fois le shell fermé ils seront supprimés

### Supprimer un alias temporaire
- La commande `unalias [CMD_ALIAS]` supprime un alias
- Attention si il ne s'agit pas d'un alias temporaire, il sera recrée via son fichier au prochain chargement d'un shell

## Lister les alias
- Pour lister les alias utilisez la commande `alias` seule

## Empêcher l'utilisation d'un alias
- L'anti slash (`\`) devant un alias force la commande de base à s'activer et non pas l'alias
  - Exemple : `\[CMD_ALIAS]`
- Exemple : `ls` qui serait l'alias suivant `ls -a` (`alias ls='ls -a'`)
  - Si vous souhaitez utilisez le `ls` traditionnel et non pas l'alias, utilisez `\ls`