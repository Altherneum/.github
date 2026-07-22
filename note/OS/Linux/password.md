# Changer les mots de passes
## Password
- `passwd` Outils de changements des mots de passe
  - `passwd [Utilisateur]` Change le mot de passe de l'utilisateur, va demander le mot de passe actuel
  - `sudo passwd [Utilisateur]` Change le mot de passe de l'utilisateur via le compte root, ne demandera pas le mot de passe actuel
  - `more etc/passwd` liste d'utilisateurs
    - Utilisateurs, x (ancien MDP), UUID, ID de groupe, nom d'affichage, répertoire de connexion, shell par défaut
      - `man 5 passwd`
  - `more etc/shadow` Liste des mot de passe (chiffrés via `crypt`)
    - Utilisateurs, mot de passe, Date de dernier changement du mot de passe, 0|1 si il doit changer de mot de passe, âge minimum du mot de passe, âge maximum du mot de passe, période d'avertissement avant expiration, période d'inactivité du mot de passe, date de fin du mot de passe
- `pwck` Vérifie la cohérance entre passwd et shadow

## Récupération de compte root
[gcore.com/learning/how-to-reset-password-in-linux/](https://gcore.com/learning/how-to-reset-password-in-linux/)