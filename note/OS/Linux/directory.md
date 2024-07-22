# Dossiers
## Changer de dossier
- `cd /[PATH]` Se déplacer depuis la racine du disque vers le chemin précisé
- `cd [PATH]` Se déplacer du dossier actuel vers le chemin précisé
- `cd ..` retourne en arrière

- `cd` ou `cd ~` Votre home

- `cd -` Retourne dans le dossier précendent

## Créer un dossier
- `mkdir [DOSSIER]` Crée un dossier
  - `mkdir -p [DOSSIER1]/[DOSSIER2]/[DOSSIER3]` Créer les sous dossiers
    - Exemple : `mkdir -p code/repo/aSuperRepo/src`
  - `mkdir [FOLDER1] [FOLDER1Bis] [FOLDER1]/[SUBFOLDER1]` Créer plusieurs dossiers
    - `mkdir code backup code/repo`

## Supprimer un dossier
- `rmdir [DOSSIER]` Supprime un dossier
  - `rmdir -r [DOSSIER]` Récursif

## Afficher le chemin actuel
- `pwd` Affiche le chemin actuel