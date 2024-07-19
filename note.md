# Lost notes
- VM Hyper-V stopés le derniers jours

# To test
- Tester auto shut down
- Block file type (bat, ps1, CMD, etc)
- Password policy
- Firewall
- OpenVPN IP check

# To do
- Nettoyer [Github ... /note/notes-network.md](https://github.com/Altherneum/.github/blob/main/note/notes-network.md) | [/note/notes-network.md](/note/notes-network.md)
- Routage [Github ... /note/Network/Cisco/routage.md](https://github.com/Altherneum/.github/blob/main/note/Network/Cisco/routage.md)
- infos.md to add on website [Github ... /note/OS/Windows/Active-Directory/infos.md](https://github.com/Altherneum/.github/blob/main/note/OS/Windows/Active-Directory/infos.md)









# Test Approbation de domaine
## Utilisateurs et ordinateurs Active Directory Domaine enfant distant approbation
- Créer une zone `@_M2I` similaire à la façon de faire sur le serveur AD principale

### Partage
- Créer dossier
- Supprimer héritage
- Nouvelle UO (Groupe, utilisateurs, ordinateurs, ...)

### Utilisateurs et ordinateurs
- Dans utilisateurs et Ordinateurs AD
  - Créer UO User etc, partage, etc
  - TO DO -----------------------------------------

## Serveur 1
- Crée groupe dans IT
  - Universelle
  - `U_IT_RW`
  - Ajouter G_IT, dans U_IT
  - Nordine aura accès au ressource d'ETUDE.LOCAL et depuis ETUDE a accès à FORMATION aussi

### Test
Attention pleins de groupes ont étés ajoutés les un dans les autres pour tester le shared folder du domaine enfant ETUDE.LOCAL, mais ne marche pas (Groupe Universel added, and added on ETUDE groups IT)

### Conclusion
Tout a été crée, peut inter connecté des domaines, mais partage de fichier impossible

REGISTER LA ZONE DANS L'AD (Dans DNS) ?????











# CV update
Avec Philipe LAMBERT

---
- Attention aux langages et pré faire des phrases de speech
- Mots clés qui permettent de créer un speech sans relier comme un robot
- Transformer instabilité pro en force
  - Vision globale, adaptivité, expériences multiples
---
- âge
- photo
- Formation en cours date de fin
- Riche ROME pole emploi
- Né avec un clavier entre les mains
- Hobie
- lien si imprimer












# PowerShell
```
$i = 0                # $i = 0
$i++                  # $i is incremented by 1
$j = $i--             # $j takes on the value of $i before the decrement

$a = 1,2,3
$b = 9,8,7
$i = 0
$j = 1
$b[$j--] = $a[$i++]   # $b[1] takes on the value of $a[0], then $j is
                      # decremented, $i incremented

$i = 2147483647       # $i holds a value of type int
$i++                  # $i now holds a value of type double because
                      # 2147483648 is too big to fit in type int

[int]$k = 0           # $k is constrained to int
$k = [int]::MaxValue  # $k is set to 2147483647
$k++                  # 2147483648 is too big to fit, imp-def behavior

$x = $null            # target is unconstrained, $null goes to [int]0
$x++                  # value treated as int, 0->1
```

# Unary
```
# Unary plus
Description:
An expression of the form + unary-expression is treated as if it were written as 0 + unary-expression (§7.7). The integer literal 0 has type int.

This operator is right associative.

Examples:
+123L         # type long, value 123
+0.12340D     # type decimal, value 0.12340
+"0xabc"      # type int, value 2748

# Unary minus
Description:
An expression of the form - unary-expression is treated as if it were written as 0 - unary-expression (§7.7). The integer literal 0 has type int. The minus operator can be any one of the dash characters listed in §7.2.

This operator is right associative.

Examples:
-$true     # type int, value -1
-123L      # type long, value -123
-0.12340D  # type decimal, value -0.12340

# The unary -join operator
Description:
The unary -join operator produces a string that is the concatenation of the value of one or more objects designated by unary-expression. (A separator can be inserted by using the binary version of this operator (§7.8.4.4).)

unary-expression can be a scalar value or a collection.
```









## Variable env
Permet de créer des commandes auto













## Commandes utiles

- `ShowCommand` [Affiche la commande](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/show-command?view=powershell-7.4) en mode visuel

- `sconfig` Outil de configuration du serveur
  - CMD ou PS ?


- `bcdedit` (Données de configuration de démarrage)
  - To test
- `mmc` Microsoft Management Console
  - To test



- `Get-ADUser` Utilisateur de l'AD
- `Get`, `Set`, `Add`, `New` ... Lister les props 











# Droit partage
Pour modifier,
Doit avoir droit edit sur Partage du dossier
Et sur l'onglet sécurité

si restriction, est prio sur permission





# TPM
TPM.MSC permet de vérifier si TPM est présent

# Bitlocker
- Doit avoir TPM 2.0
- Comment activer ???
- commande : `manage-bde`




# WinRM
- Permet la gestion à distance de Windows
- Ports :
  - `HTTP` : `5985`
  - `HTTPS` : `5986`
- Windows Remote Management (WinRM)

- `Get-Service WinRM`

## Activer WinRM
- `Enable-PSRemoting`
- ou `winrm quickconfig`

## Vérifier si l'éxecution de scripts est active
- `Get-ExecutionPolicy` Politique sur l'exécution de scripte à distance
- `Set-ExecutionPolicy [POLICY]`

## Ouvrir une session
- `Enter-PSSession -ComputerName CORE01 -Credential "DomaineName\UserName"`

## Invoke command
`Invoke-Command -ComputerName <Computer> -ScriptBlock {Commande ; Commande 2}`

`Invoke-Commannd -ComputerName PC1,PC2,PC3 -ScriptBlock { dir C:\ }`

`Invoke-command -computername "PC1,DC1" -scriptblock { Start-process chrome.exe }`

## Get-Help operators
get-help about_Comparison_Operators
update-help




# MSG Win
Send msg to network computer
`msg <user_name>`
msg 1 hello

-or-

msg 0 hello

It would be curious if you get the same error. The ‘*’ sends to every session, so one of them is having a problem. But oh well, it works !





















# Linux 
## LVM
- Logical volume management
- Permet plusieurs disques en un seul
- Permet d'écrire sur plusieurs disques à la fois
## GRUB
Boot-loader
## Deamon
Logiciel au démarrage en arrière plan
## Chron
Gestionnaire basé sur le temps
## FastFetch
to setup & use for .MD visuals

# LS
Afficher  les  informations  des  FICHIERs  (du  répertoire courant par défaut). Les entrées sont triées alphabétiquement si aucune des options
- `ls -l` Utiliser un format d’affichage long
- `ls -a` Affiche les fichiers cachés
- `ls -R` Affiche les fichiers de manière récursive
- `ls -l /tmp /etc` Affiche les deux dossiers

### To filter
- `[CMD] -o Argument Arguments2 --Option-In-Full-Words Argument argument2`
  - `ls -l -t -r` = `ls ltr`
  - `ls -l /tmp /etc` Affiche les deux dossiers
  - `ls --directory --dired` = `ls -dD` = `ls -d -D`

- `Date`
  - `Date +%T`
- `Man` Manuel
- `Man sudo` Affichel le manuel de sudo
- `Man [CMD] -k`
- `Man 5 [CMD]` Fichier de config de la commande
- `su` SuperUser
  - `su -`
  - `su -l [Utilisateur]` Se connecte en SU en tant que l'utilisateur
  - `sudo [CMD]` SuperUser do commande
  - `nano /etc/sudoers` Liste des comptes SU
- `Nano`
- `Clear` Clear l'interface de commande



- `apt install Most` Paquet pour l'affichage de texte avec couleurs
- `export PAGER=most` Passe la variable globale de pagination sur le software most
  - `export` Variable global (temporaire)
  - `PAGER=most` Pagination passer sur le software most

- `more etc/shells` Liste des shells disponibles
- `more /etc/passwd` Affiche la liste des utilisateurs et processus et leurs shells
- `echo $SHELL` Affiche le shell actuel
  - `echo $0` Affiche le nom du shell actuel
- `ps -p $$` Affiche les détails du shell actuel

- `chsh` Change de shell
- `ls -l /bin/sh` Affiche les shells
- `apt install zsh` Install ZSH shell

- `whereis zsh` Affiche le chemin de zsh
- `more [File]` ????

- `nano /etc/apt/source.list` liste des repo

- `sudo nano /etc/nanorc` Config de nano
```
set linenumbers
set autoindent
set tabsize 4
set brackets
set matchbrackets "(<[{>]})"
set brackets ""')>]}"
set historylog
set locking
set mouse

set titlecolor bold,white,red
set indicator
set scrollercolor red
set numbercolor red
set keycolor bold,red
set functioncolor green
```

- `cd /abc` depuis la racine du disque
- `cd abc` se déplace du dossier actuel vers abc
- `cd ..` retourne en arrière
- `cd` ou `cd ~` Votre home
- `cd -` Retourne dans le dossier précendent
- mkdir

- `ls` liste des fichiers et dossiers
- `ls -a` Fichier cachés

- `mkdir` Crée un dossier
  - `mkdir -p f1/f2/f3` Créer les sous dossiers
  - `mkdir p1 p2 p1/subp1` Créer plusieurs dossiers  
- `rmdir [DOSSIER]` Supprime un dossier
  - `rmdir -r [DOSSIER]` Récursif
- `rm [FICHIER]` Supprime un fichier
  - `rm -r [PATH]` Supprime les fichiers dans path de manière récursive
  - `rm -i [FICHIER]` Demande la confirmation


- `tree` Listing en arbre des dossiers
- `apt install tree`




# To test didn't worked
- `.profile` Fichier de chargement du profil
- `.bash_history`
- `.bashrc` Fichier de config du profil

- [cyberciti.biz/faq/create-permanent-bash-alias-linux-unix/](https://www.cyberciti.biz/faq/create-permanent-bash-alias-linux-unix/)
- [doc.ubuntu-fr.org/alias](https://doc.ubuntu-fr.org/alias)

- `.bash_aliases` Alias des commandes (Fichier à créer) dans le `/home/[USER]/`
  - Ajouter dans le fichier (Exemple) `alias cls='clear'`
  - Ou encore `alias h='history'`
    - Recharger le fichier via : `source .bashrc`
    - Ou recharger : `source .bash_aliases`
    - Ou recharger : `source .profile`
  - Vérifier la présence du chargement des alias dans le fichier `.bashrc` ~L.100
```
alias c='clear'
alias h='history'
alias ll='ls -lh'
alias cx='chmod u+x'
```



# File
- `file [FICHER]` Affiche le type de fichier

# Read file
- `more [FICHIER]`, `less [FICHIER]`, `cat [FICHIER]` Affiche le contenu des fichiers
  - `more` Page par page
    - `ESPACE` Avancer d'un écran
    - `RETURN` Avancer d'une ligne
  - `less` Commande `more` avec des commandes de déplacement
    - `e` Avancer d'une ligne
    - `y` Reculer d'une ligne
    - `f` Avancer d'une page
    - `b`  Reculer d'une page
    - `h` ou `?` Aide
    - `q` Quitter la commande `more`
  - `cat` Concaténation
- `head [FICHIER]` Première lignes du fichier
- `tail [FICHIER]` Dernière lignes du fichier

# Write file
- `> [FILE]` Créer un fichier
  - `ABC > test` Créer le fichier `test` et écrit dedans `ABC`
- `>> [FILE]` Créer le fichier si il n'existe pas
  - `ABC >> test` Créer `test` si il n'exsite pas, et ajoute `ABC` dedans sans écraser

- `[CMD|FILE...] < [FILE]` Envoie les informations de la droite vers la gauche
  - `Cat < File1 > new_file` Envoie `File1` dans `cat`, puis envoie le tout dans `new_file`

- `[Something_Creating_error] 2> [file]` Redirige même les erreurs
  - `toto 2> error_log`
  - `fin / -name toto 2> error_log` Enverra que les erreurs dans le log, et conserve les bons résultats dans la console
  - `fin / -name toto 2> error_log > good_log` Envoie les erreurs dans `error_log`, et les bons résultats dans `good_log`

- `[CMD] &> [FILE]` Envoie les résultats et les erreurs dans le fichier
  - `[CMD] > [FILE] 2>&1` Envoie les résultats et les erreurs dans le fichier


# Touch
- `touch [FILE]` Modifie la date d'accès au fichier à la date actuelle

# Password
- `pwck` Vérifie la cohérance entre passwd et shadow

- `more etc/passwd` liste d'utilisateurs
  - Utilisateurs, x (ancien MDP), UUID, ID de groupe, nom d'affichage, répertoire de connexion, shell par défaut
    - `man 5 passwd`
- `more etc/shadow` Liste des mot de passe (chiffrés via `crypt`)
  - Utilisateurs, mot de passe, Date de dernier changement du mot de passe, 0|1 si il doit changer de mot de passe, âge minimum du mot de passe, âge maximum du mot de passe, période d'avertissement avant expiration, période d'inactivité du mot de passe, date de fin du mot de passe





# Type d'utilisateurs
- Root
  - UUID : 0
- Administratif (Système)
  - UUID < 1000
- Utilisateurs
  - UUID > 1000

# Version de l'OS
- `cat /etc/os-release` Fichier de release
- `lsb_release -a`
- `hostnamectl`
- `uname` OS codename
  - `uname -a` Toutes les infos de l'OS

# Doc
- `man [COMMANDE]`
  - `man man` Affiche le manuel de la commande `man`



- `/etc/motd`








# Sudo login
- Example (login shell):
  - `sudo -i`
- Example (with a specified user):
  - `sudo -i -u [USER]`
- Example (with a command):
  - `sudo -i -u [USER] [CMD: ex (whoami)]`
- Example (print user's `$HOME`):
  - `sudo -i -u user echo \$HOME`








# Echo same line
- If it does not work on your system, you can replace this way,
  - `echo "test \c"; echo " same line"`
- can become,
  - `echo -n "test"; echo " same line"`



# Exécuter un fichier
- Taper son nom `File.sh`
- Taper son nom relatif `./File.txt` Si ce n'est pas un script classique
  - Ou un nom dupliqué : (Ex rm en fichier alors que la commande rm existe)
- Le déplacer dans `/bin` puis `source [PATH]` le fichier ou est `bin` (Sourcer une seul fois pour ajouter le path dans `$PATH`)

# Terminal
## STD
- `stdin` Taper au clavier
- `stdout` Sortie écran
- `stderr` Les erreurs

## Informations
- Options et arguments
- Code de retour

# Pipe
Le résultat de la commande devant le pipe (`|`), devient la commande après le pipe
- `systemctl | wc -l` Compte le nombre de ligne du résultat de la commande systemctl


# find
- `find [PATH] -name [FILE_NAME]` Recherche le fichier




# Remoting
```
# Debian
dpkg --list | grep ssh                      # Liste les paquets SSH

# Sur Alma
rpm -qa | grep ssh                          # Liste les paquets SSH
ip a                                        # Liste les adresses IP (Inet = ip local net) # 10.20.222.86/24

# Debian & Alma
Systemctl status sshd                       # Vérifie si sshd est lancé ou stoppé

# Alma
ls -l /etc/ssh                              # Liste les fichiers SSH
more /etc/ssh/sshd_config                   # La configuration SSHD
useradd -m -s /bin/bash remotejeb           # Créer l'utilisateur remotejeb
useradd -m -s /bin/bash jebremote           # Créer l'utilisateur jebremote

# Debian
useradd -m -s /bin/bash remotejeb           # Créer l'utilisateur jebremote aussi sur debian
useradd -m -s /bin/bash jebremote           # Créer l'utilisateur remotejeb aussi sur debian

nano etc/sudoers                            # Liste des utilisateurs sudo
# Ajouter les logins dans la liste sudoers  # Configure les utilisateurs sudo

# Alma
nano /etc/hostname                          # Config hostname
# Ajouter "alma" dedans
reboot                                      # Si besoin car recharge pas tout seul
hostnamectl set-hostname          # ou      # systemctl restart systemd-hostnamed                    # à la place de reboot si vous souhaitez juste le recharger # A TESTER
passwd remotejeb                            # Change le mot de passe 
SuperRemote11                               # Taper le mot de passe suivant
passwd jebremote                            # Same here
SuperRemote11                               # Same password :3 ...

# Debian
ssh remotejeb@10.20.222.86                  # Lance une connection SSH
SuperRemote11                               # S'auth avec le compte remotejeb et son mot de passe
###################################################################################################

exit                                        # Quitter alma pour debian
nano /etc/hosts                             # Config des hôtes
# Ajouter la ligne # 10.20.222.86   alma    # Configure l'IP pour être résolue par "alma"

SSH remotejeb@alma                          # On peut du coup SSH sur Alma sans taper l'IP

SSH alma                                    # Va se connecter sur le compte reconnu en cours d'utilisation (si identique au système distant)

# Sur debian
scp [FICHIER] remotejeb@alma:[PATH][FICHIER]  # Envoie le fichier vers alma dans le dossier
    scp test.txt remotejeb@alma:/home/remotejeb/test.txt
```

jebremote
remotejeb