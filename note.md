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

## AB testing
Pipeline CI CD de AB testing indev.site.com   beta.site.com   release.site.com


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

## Unary
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
# Windows
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

## Droit partage
Pour modifier,
Doit avoir droit edit sur Partage du dossier
Et sur l'onglet sécurité

si restriction, est prio sur permission

## TPM
TPM.MSC permet de vérifier si TPM est présent

## Bitlocker
- Doit avoir TPM 2.0
- Comment activer ???
- commande : `manage-bde`
## WinRM
- Permet la gestion à distance de Windows
- Ports :
  - `HTTP` : `5985`
  - `HTTPS` : `5986`
- Windows Remote Management (WinRM)

- `Get-Service WinRM`

### Activer WinRM
- `Enable-PSRemoting`
- ou `winrm quickconfig`
## MSG Win
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


## Color
- `apt install Most` Paquet pour l'affichage de texte avec couleurs
- `export PAGER=most` Passe la variable globale de pagination sur le software most
  - `export` Variable global (temporaire)
  - `PAGER=most` Pagination passer sur le software most

## Shells list
- `more etc/shells` Liste des shells disponibles
- `more /etc/passwd` Affiche la liste des utilisateurs et processus et leurs shells
- `echo $SHELL` Affiche le shell actuel
  - `echo $0` Affiche le nom du shell actuel
- `ps -p $$` Affiche les détails du shell actuel

- `chsh` Change de shell
- `ls -l /bin/sh` Affiche les shells
- `apt install zsh` Install ZSH shell

## WhereIs
- `whereis zsh` Affiche le chemin de zsh
- `more [File]` ????

## Source list
- `nano /etc/apt/source.list` liste des repo

## Nano
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
## Tree
- `tree` Listing en arbre des dossiers
- `apt install tree`

## Password
- `pwck` Vérifie la cohérance entre passwd et shadow

- `more etc/passwd` liste d'utilisateurs
  - Utilisateurs, x (ancien MDP), UUID, ID de groupe, nom d'affichage, répertoire de connexion, shell par défaut
    - `man 5 passwd`
- `more etc/shadow` Liste des mot de passe (chiffrés via `crypt`)
  - Utilisateurs, mot de passe, Date de dernier changement du mot de passe, 0|1 si il doit changer de mot de passe, âge minimum du mot de passe, âge maximum du mot de passe, période d'avertissement avant expiration, période d'inactivité du mot de passe, date de fin du mot de passe

## Type d'utilisateurs
- Root
  - UUID : 0
- Administratif (Système)
  - UUID < 1000
- Utilisateurs
  - UUID > 1000
## Echo same line
- If it does not work on your system, you can replace this way,
  - `echo "test \c"; echo " same line"`
- can become,
  - `echo -n "test"; echo " same line"`
## Exécuter un fichier
- Taper son nom `File.sh`

- Taper son nom relatif `./File.txt` ou `/[PATH]/[FILE].sh`
  - Ou un nom dupliqué : (Ex rm en fichier alors que la commande rm existe)
- Le déplacer dans `/bin` puis `source [PATH]` le fichier ou est `bin` (Sourcer une seul fois pour ajouter le path dans `$PATH`)

- Lancer la commande : `Source [FICHIER]` (En mémoire jusqu'au relancement du shell !)
- équivaut à `. [FICHIER]`
## Include
`.` devant un fichier permet de l'inclure dans le shell en cours d'utilisation

## STD
- `stdin` Taper au clavier
- `stdout` Sortie écran
- `stderr` Les erreurs

## Informations
- Options et arguments
- Code de retour

## Pipe
Le résultat de la commande devant le pipe (`|`), devient la commande après le pipe
- `systemctl | wc -l` Compte le nombre de ligne du résultat de la commande systemctl
## Lien symbolique
`ln -ls`

## MOTD
- `/etc/motd`
- `/etc/motd.d/[NAME].motd`
## Cmd to doc
- `Date`
  - `Date +%T`
- `Nano`
- `Clear` Clear l'interface de commande

## Config files
`/etc/profile` is a global file that gets run before `~/.profile`.

`/etc/profile.d/` is a folder that contains scripts called by `/etc/profile`
When `/etc/profile` is called (when you start/login a shell), it searches for any files ending in `.sh` in `/etc/profile.d/` and runs them with one of these commands:
`source /etc/profile.d/myfile.sh`
`. /etc/profile.d/myfile.sh`

Technically, `/etc/bash.bashrc` is invoked for interactive, non-login bash shells for all users.

However, usually `/etc/profile` (which is invoked for all login shells) calls `/etc/bash.bashrc` as well. So that means `/etc/bash.bashrc` is also invoked for all logins shells as well.

## Run CMD on open shell
/etc/bash.bashrc

## CMD or GUI
Ctrl Alt F1 = GUI
Ctrl Alt F2 = CMD

## CrashVM
Tester pip auto start avec /etc/bash.bashrc
tester si avec CTRL+ALT+F2 si ça lock ou laisse le CMD possible

## Ls recursive
ls -R

## Dev/null
Trash / void
Envoyer des infos dedans les supprimes
`[CMD] 2>/dev/null` envoie les erreurs dans le dev/null

 
## Shebang
Chemin du shell à utiliser
Ex : `#!bin/bash`

## Types set
- `typeset -i i=10`

## Printf
`printf` Echo avec syntaxe supplémentaire
  - ![alt text](https://github.com/Altherneum/.github/blob/main/note/assets/images/printf.png?raw=true)

## Find
`find`
  - `find [PATH] -name [NAME]`
    - `find /home -name *.pub` Rechercher des fichiers finissant par .pub
  - `find [PATH] -name [NAME] [ACTION]` Effectuer une action si trouvé
    - `find /home -name *.pub -exec more {} \;`, `{}` correspond au résultat de recherche
    - `find /home -name *.pub -ok more {} \;`, `-ok` Va demander confirmation avant de lancer la commande
    - `find /home -name *.pub -size +15M`, `-size +15M` Ne va retourner que les fichiers de plus de 15Mo avec le nom finissant par .pub

## Escape spécial char
- `\` Permet d'échapper un caractère
- `\'` Permet de laisser `'` s'afficher

## Expension
`rm path/{subpath1,supath2}` Va supprimer path/subpath1 et path/subpath2

## Return code
0 = OK 
1 = erreur(s)
2 = erreur grave
127 = Commande introuvable

`ls [PATHERROR]`, puis `echo $?` si != 0 il y a eu une erreur

## check admin
```
#!/bin/bash
read -p "Entrez un nom d'utilisateur": answer
if [ $(id "$answer" -u) -eq 0]
  then echo "Admin" ; else echo "Not admin"
fi
```

## check file
`./script [FILE]`
```
#!/bin/bash
if [ $# -eq 1 ] ; then
  test -f $1
  if [ $? -eq 0 ]
    then echo "Fichier OK"
    else echo "Pas un fichier classique"
  fi
  else echo "Le script $0 doit avoir un seul paramètre"
fi
```

## set
```
set -x
[CODE]
set +x
```

debug mode



## Shift
`./script.sh a b c`
```
while [ $# -ne 0 ]
do echo $1
shift
done
```
va donner A, puis B, puis C
`shift` décale dans les paramètres

## sleep
`sleep 60s`
`sleep 1m`
Attend un délais

## read
```
echo "Entrez ABC ou break"
read response
if [ $response = "ABC" ]
  then echo "ok ABC"
elif [ $response = "break" ]
  then echo "breaking while ..."
  break
else echo "erreur faite ABC ou break :("
fi
```

# fil rouge
Firewall *2 ("UFW" sur debian, "D" sur redhat) + proxy




# Note
# Uptime & grep
`uptime`
`df -h | grep '^/dev' | awk`
`free -m` Mémoire en méga
`free -h` Mémoire lisible par un humain
`memfree=$(free -m | awk '/Mem/ {print $4}')`

# CMD AWK & SED
`AWK` permet de stocker dans une variable
[AWK malekal](https://malekal.com)
`SED` Editeur de text non intéractif pour des regex 

`cut`

# UI
`whiptail` Créer des menus

# Cron
`crontab` vs `cron` (admin)
`man 5 crontab`

# Supervision
`prometheus monitoring`
+ `graphana`

# DPKG
`dpkg` debian package (Gère pas les dépendances)
`dpkg-reconfigure`
`dpkg -i [PATH]/[NOM].deb` installer le paquet
`apt install [PATH]/[NOM].deb`
- [pkgs.org](https://pkgs.org)


`echo $DISPLAY`

# ITIL
Guide de bonne pratique par M.Tatcher

Information technology Infrastructure library

1. Les concepts clés de la gestion des services
  1. Concentrez-vous sur la valeur
  2. Démarrez depuis là où vous êtes
  3. Progressez par itérations, en apprenant de
  l’expérience
  4. Collaborez et encouragez la visibilité
  5. Pensez et travaillez de manière holistique
  6. Restez simple et pratique
  7. Optimisez et automatisez

2. Les quatre dimensions de la gestion des services
  1. Les organisations et les collaborateurs
  2. L’information et la technologie
  3. Les partenaires et fournisseurs
  4. Les chaînes de valeur et processus


# String concat
à faire

# Export
Export var ???

# Source to doc
```
.
source
```

sont identiques

# Readonly var
Syntaxe

 Sélectionnez
readonly var1 [var2 ?] 
readonly
Cette commande, lorsqu'elle est employée sur une variable, la verrouille contre toute modification et/ou suppression, volontaire ou accidentelle. Une fois verrouillée, la variable ne disparaîtra qu'à la mort du processus qui l'utilise (cf. Gestion des processus).

Employée sans argument, l'instruction « readonly » donne la liste de toutes les variables protégées.

# Read
To doc
ask user input



# Variable à filter
```

https://www.mode83.net/atelier/centre_ressources/crs_fichiers/Formation/OSR2K9/Linux/Programmation%20Bash.pdf


$DIRSTACK
La valeur du dessus de la pile de répertoires (affectée par pushd166 et popd166)
Cette variable intégrée correspond à la commande dirs. Néanmoins, dirs affiche le contenu entier de la pile de répertoires.
69
$EDITOR
L'éditeur invoqué par défaut par un script, habituellement vi ou emacs.
$EUID
Numéro d'identifiant « effectif » de l'utilisateur.
Numéro d'identification, quelle que soit l'identité que l'utilisateur actuel assume, peut-être suite à un su.
Attention
$EUID n'est pas nécessairement le même que $UID.
$FUNCNAME
Nom de la fonction en cours.
xyz23 ()
{
echo "$FUNCNAME en cours d'exécution." # xyz23 en cours d'exécution.
}
xyz23
echo "FUNCNAME = $FUNCNAME" # FUNCNAME =
# vide en dehors d'une fonction
$GLOBIGNORE
Une liste de modèles de noms de fichiers à exclure de la correspondance lors d'un remplacement.
$GROUPS
Groupes auxquels appartient l'utilisateur.
C'est une liste (de type tableau) des numéros d'identifiant de groupes pour l'utilisateur actuel, identique à celle enregistrée
dans /etc/passwd et /etc/group.
root# echo $GROUPS
0
root# echo ${GROUPS[1]}
1
root# echo ${GROUPS[5]}
6
$HOME
Répertoire personnel de l'utilisateur, habituellement /home/utilisateur (voir l'Exemple 9.15, « Utiliser la substitution
et les messages d'erreur »)
$HOSTNAME
La commande hostname définit le nom de l'hôte au démarrage en utilisant un script de démarrage. Néanmoins, la fonction
gethostname() initialise la variable interne Bash $HOSTNAME. Voir aussi l'Exemple 9.15, « Utiliser la substitution et les
messages d'erreur ».
$HOSTTYPE
Type de l'hôte.
Comme $MACHTYPE, identifie le matériel du système.
bash$ echo $HOSTTYPE
i686
Les variables revisitées
70
$IFS
Séparateur interne du champ de saisie.
Cette variable détermine la façon dont Bash reconnaît les champs ou les limites de mots lorsqu'il interprète des chaînes de caractères.
La valeur par défaut est un espace blanc (espace, tabulation et retour chariot) mais peut être changé, par exemple, pour analyser un fichier de données séparées par des virgules. Notez que $* utilise le premier caractère contenu dans $IFS. Voir
l'Exemple 5.1, « Afficher des variables bizarres ».
bash$ echo "$IFS"
(Avec la valeur par défaut de $IFS, une ligne blanche apparaît.)
bash$ echo "$IFS" | cat -vte
^I$
$
(Affiche un espace blanc -- un espace, ^I [tabulation horizontale],
ou un retour chariot -- et affiche un dollar ($) en fin de ligne.)
bash$ bash -c 'set w x y z; IFS=":-;"; echo "$*"'
w:x:y:z
(Lit les commandes à partir de la chaîne et affecte tout
argument suivant les paramètres de position)
Attention
$IFS ne gère pas les espaces blancs de la même façon que les autres caractères.
Exemple 9.1. $IFS et espaces blancs
#!/bin/bash
# $IFS traite les espaces blancs différemment des autres caractères.
affiche_un_argument_par_ligne()
{
for arg
do echo "[$arg]"
done
}
echo; echo "IFS=\" \""
echo "-------"
IFS=" "
var=" a b c "
affiche_un_argument_par_ligne $var # affiche_un_argument_par_ligne `echo
" a b c "`
#
# [a]
# [b]
# [c]
echo; echo "IFS=:"
echo "-----"
IFS=:
Les variables revisitées
71
var=":a::b:c:::" # Identique à ci-dessus, mais substitue ":" à " ".
affiche_un_argument_par_ligne $var
#
# []
# [a]
# []
# [b]
# [c]
# []
# []
# []
# La même chose arrive avec le séparateur de champs "FS" dans awk.
# Merci, Stephane Chazelas.
echo
exit 0
(Merci beaucoup, Stéphane Chazelas, pour cette clarification et ces exemples.)
Voir aussi l'Exemple 15.37, « Analyser le domaine d'un courrier indésirable » , Exemple 10.7, « Un remplaçant de grep pour
les fichiers binaires » et Exemple 18.14, « Analyser une boîte mail » pour des exemples instructifs sur l'utilisation de $IFS.
$IGNOREEOF
Ignore EOF : nombre de fins de fichier (control-D) que le shell va ignorer avant de déconnecter.
$LC_COLLATE
Souvent intégré dans les fichiers .bashrc ou /etc/profile, cette variable contrôle l'ordre d'examen dans l'expansion
des noms de fichiers et les correspondances de modèles. Si elle est mal gérée, LC_COLLATE peut apporter des résultats inattendus dans le remplacement de noms de fichiers.
Note
À partir de la version 2.05 de Bash, le remplacement de noms de fichiers ne tient plus compte des lettres en minuscules et en majuscules dans une suite de caractères entre crochets. Par exemple, ls [A-M]* correspondrait à
la fois à Fichier1.txt et à fichier1.txt. Pour annuler le comportement personnalisé de la correspondance par crochets, initialisez LC_COLLATE à C par un export LC_COLLATE=C dans /etc/profile
et/ou ~/.bashrc.
$LC_CTYPE
Cette variable interne contrôle l'interprétation des caractères pour le remplacement et la correspondance de modèles.
$LINENO
Cette variable correspond au numéro de ligne du script shell dans lequel cette variable apparaît. Elle n'a une signification que
dans le script où elle apparait et est surtout utilisée dans les phases de débogage.
# *** DEBUT BLOC DEBUG ***
dernier_argument_command=$_ # Le sauver.
echo "À la ligne numéro $LINENO, la variable \"v1\" = $v1"
echo "Dernier argument de la ligne exécutée = $dernier_argument_command"
# *** FIN BLOC DEBUG ***
$MACHTYPE
Type de machine.
Identifie le matériel du système.
bash$ echo $MACHTYPE
i686
Les variables revisitées
72
$OLDPWD
Ancien répertoire courant (« OLD-print-working-directory », ancien répertoire où vous étiez).
$OSTYPE
Type de système d'exploitation.
bash$ echo $OSTYPE
linux
$PATH
Chemin vers les binaires, habituellement /usr/bin/, /usr/X11R6/bin/, /usr/local/bin, etc.
Lorsqu'une commande est donnée, le shell recherche automatiquement l'exécutable dans les répertoires listés dans le chemin.
Le chemin est stocké dans la variable d'environnement, $PATH, une liste des répertoires, séparés par le symbole ":". Normalement, le système enregistre la définition de $PATH dans /etc/profile et/ou ~/.bashrc (voir l'Annexe G, Fichiers
importants).
bash$ echo $PATH
/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin:/sbin:/usr/sbin
PATH=${PATH}:/opt/bin ajoute le répertoire /opt/bin au chemin actuel. Dans un script, il peut être avantageux
d'ajouter temporairement un répertoire au chemin de cette façon. Lorsque le script se termine, le $PATH original est restauré
(un processus fils, tel qu'un script, ne peut pas changer l'environnement du processus père, le shell).
Note
Le « répertoire » courant, ./, est habituellement omis de $PATH pour des raisons de sécurité.
$PIPESTATUS
Variable de type tableau366 contenant les codes de sortie de la dernièrecommande exécutée via un tube. De façon étonnante,
ceci ne donne pas obligatoirement le même résultat que le code de sortie43 de la dernière commande exécutée.
bash$ echo $PIPESTATUS
0
bash$ ls -al | bogus_command
bash: bogus_command: command not found
bash$ echo $PIPESTATUS
141
bash$ ls -al | bogus_command
bash: bogus_command: command not found
bash$ echo $?
127
Les membres du tableau $PIPESTATUS contiennent le code de sortie de chaque commande respective exécutée via un tube.
$PIPESTATUS[0] contient le code de sortie de la première commande du tube, $PIPESTATUS[1] le code de sortie de la
deuxième commande et ainsi de suite.
Attention
La variable $PIPESTATUS peut contenir une valeur 0 erronée dans un shell de connexion (dans les versions
précédant la 3.0 de Bash).
tcsh% bash
bash$ who | grep nobody | sort
bash$ echo ${PIPESTATUS[*]}
0
Les variables revisitées
73
1Le PID du script en cours est $$, bien sûr.
Les lignes ci-dessus contenues dans un script produiraient le résultat attendu, 0 1 0.
Merci, Wayne Pollock pour avoir partagé ceci en apportant l'exemple ci-dessus.
Note
La variable $PIPESTATUS donne des résultats inattendus dans certains contextes.
bash$ echo $BASH_VERSION
3.00.14(1)-release
bash$ $ ls | commande_boguee | wc
bash: commande_boguee: command not found
0 0 0
bash$ echo ${PIPESTATUS[@]}
141 127 0
Chet Ramey attribue l'affichage ci-dessus au comportement de ls. Si ls écrit dans un tube dont la sortie n'est
pas lue, alors SIGPIPE le tue et son code de sortie43 est 141. Sinon, son code de sortie est 0, comme attendu.
C'est certainement le cas pour tr.
Note
$PIPESTATUS est une variable « volatile ». Elle doit être immédiatement capturée après le tube, c'est-à-dire
avant que d'autres commandes n'interviennent.
bash$ $ ls | commande_boguee | wc
bash: commande_boguee: command not found
0 0 0
bash$ echo ${PIPESTATUS[@]}
0 127 0
bash$ echo ${PIPESTATUS[@]}
0
Note
L'option pipefail456 pourrait être utile dans les cas où$PIPESTATUS ne donne pas l'information désirée.
$PPID
Le $PPID d'un processus est l'identifiant du processus (PID) père. 1
Comparez ceci avec la commande pidof.
$PROMPT_COMMAND
Une variable contenant une commande à exécuter juste avant l'affichage de l'invite principale, $PS1.
$PS1
Ceci est l'invite principale, vue sur la ligne de commande.
$PS2
La deuxième invite, vue lorsqu'une saisie supplémentaire est attendue. Elle s'affiche comme « > ».
Les variables revisitées
74
$PS3
La troisième invite, affichée lors d'une boucle select (voir l'Exemple 10.29, « Créer des menus en utilisant select »)
$PS4
La quatrième invite, affichée au début de chaque ligne d'affichage lorsqu'un script a été appelé avec l'option408 -x. Elle affiche
un « + ».
$PWD
Répertoire courant (répertoire où vous êtes actuellement)
Ceci est analogue à la commande intégrée pwd.
#!/bin/bash
E_MAUVAIS_REPERTOIRE=73
clear # Efface l'écran.
RepertoireCible=/home/bozo/projects/GreatAmericanNovel
cd $RepertoireCible
echo "Suppression des anciens fichiers de $RepertoireCible."
if [ "$PWD" != "$RepertoireCible" ]
then # Empêche la suppression d'un mauvais répertoire par accident.
echo "Mauvais répertoire!"
echo "Dans $PWD, plutôt que $RepertoireCible!"
echo "Je quitte!"
exit $E_MAUVAIS_REPERTOIRE
fi
rm -rf *
rm .[A-Za-z0-9]* # Supprime les fichiers commençant par un point.
# rm -f .[^.]* ..?* pour supprimer les fichiers commençant par plusieurs points.
# (shopt -s dotglob; rm -f *) fonctionnera aussi.
# Merci, S.C., pour nous l'avoir indiqué.
# Les noms de fichier peuvent contenir tous les caractères de 0 à 255,
# à l'exception de "/".
# La suppression des fichiers commençant par des caractères bizarres est laissé
# en exercice.
# Autres opérations ici, si nécessaire.
echo
echo "Fait."
echo "Anciens fichiers supprimés de $RepertoireCible."
echo
exit 0
$REPLY
La variable par défaut lorsqu'aucune n'est adjointe au read. Aussi applicable au menu select, mais renvoie seulement le numéro de l'élément de la variable choisie et non pas la valeur de la variable elle-même.
#!/bin/bash
# reply.sh
# REPLY est la variable par défaut d'une commande 'read'
echo
echo -n "Quel est votre légume favori? "
read
echo "Votre légume favori est $REPLY."
Les variables revisitées
75
2 Un peu analogue à la récursion, dans ce contexte, l' imbrication réfère à un modèle embarqué à l'intérieur d'un modèle plus large. Une des définitions de nest, d'après l'édition 1913 du dictionnaire
Webster, illustre très bien ceci : « une collection de boîtes, cases ou d'objets de ce type, d'une taille graduée, les unes dans les autres. »
# REPLY contient la valeur du dernier "read" si et seulement si aucune variable
#+ n'est spécifiée.
echo
echo -n "Quel est votre fruit favori? "
read fruit
echo "Votre fruit favori est $fruit."
echo "mais..."
echo "La valeur de \$REPLY est toujours $REPLY."
# $REPLY est toujours initialisé à sa précédente valeur car la variable $fruit
#+ a absorbé la nouvelle valeur obtenue par "read".
echo
exit 0
$SECONDS
Le nombre de secondes pris par l'exécution du script.
#!/bin/bash
LIMITE_TEMPS=10
INTERVALLE=1
echo
echo "Appuyez sur Control-C pour sortir avant $LIMITE_TEMPS secondes."
echo
while [ "$SECONDS" -le "$LIMITE_TEMPS" ]
do
if [ "$SECONDS" -eq 1 ]
then
unites=seconde
else
unites=secondes
fi
echo "Ce script tourne depuis $SECONDS $unites."
# Sur une machine lente, le script peut laisser échapper quelquefois
#+ un élément du comptage dans la boucle while.
sleep $INTERVALLE
done
echo -e "\a" # Beep!
exit 0
$SHELLOPTS
La liste des options408 activées du shell, une variable en lecture seule.
bash$ echo $SHELLOPTS
braceexpand:hashall:histexpand:monitor:history:interactive-comments:emacs
$SHLVL
Niveau du shell, à quel point Bash est imbriqué. 2
Si, à la ligne de commande, $SHLVL vaut 1, alors dans un script, il sera incrémenté et prendra la valeur 2.
Note
Cette variable n'est pas affectée par les sous-shells. Utilisez $BASH_SUBSHELL quand vous avez besoin
d'une indication d'une imbrication de sous-shell.
Les variables revisitées
76
$TMOUT
Si la variable d'environnement $TMOUT est initialisée à une valeur différente de zéro appelée time, alors l'invite shell dépassera son délai au bout de time secondes. Ceci causera une déconnexion.
À partir de la version 2.05b de Bash, il est possible d'utiliser $TMOUT dans un script avec un read.
# Fonctionne avec des scripts pour Bash, versions
#+ 2.05b et ultérieures.
TMOUT=3 # L'invite s'arrête dans trois secondes.
echo "Quelle est votre chanson favorite?"
echo "Faites vite car vous n'avez que $TMOUT secondes pour répondre !"
read chanson
if [ -z "$chanson" ]
then
chanson="(sans réponse)"
# Réponse par défaut.
fi
echo "Votre chanson favorite est $chanson."
Il existe d'autres façons, certaines plus complexes, pour implémenter une entrée avec temporisation. Une alternative consiste à
configurer une boucle rythmée pour signaler au script la fin de l'attente. Ceci requiert aussi une routine de gestion du signal
pour récupérer (voir l'Exemple 29.5, « Récupérer la sortie ») l'interruption créée par la boucle.
Exemple 9.2. Saisie avec délai
#!/bin/bash
# timed-input.sh
# TMOUT=3 Fonctionne aussi, depuis les dernières versions de Bash.
LIMITETEMPS=3 # Trois secondes dans cette instance, peut être configuré avec
#+ une valeur différente.
AfficheReponse()
{
if [ "$reponse" = TIMEOUT ]
then
echo $reponse
else # ne pas mixer les deux interfaces.
echo "Votre légume favori est le $reponse"
kill $! # Kill n'est plus nécessaire pour la fonction TimerOn lancée en
#+ tâche de fond.
# $! est le PID du dernier job lancé en tâche de fond.
fi
}
TimerOn()
{
sleep $LIMITETEMPS && kill -s 14 $$ &
# Attend trois secondes, puis envoie sigalarm au script.
}
VecteurInt14()
{
reponse="TIMEOUT"
AfficheReponse
exit 14
}
trap VecteurInt14 14 # Interruption de temps (14) détournée pour notre but.
Les variables revisitées
77
echo "Quel est votre légume favori?"
TimerOn
read reponse
AfficheReponse
# C'est une implémentation détournée de l'entrée de temps,
#+ néanmoins l'option "-t" de "read" simplifie cette tâche.
# Voir "t-out.sh", ci-dessous.
# Si vous avez besoin de quelque chose de réellement élégant...
#+ pensez à écrire l'application en C ou C++,
#+ en utilisant les fonctions de la bibliothèque appropriée, telles que
#+ 'alarm' et 'setitimer'.
exit 0
Une autre méthode est d'utiliser stty.
Exemple 9.3. Encore une fois, saisie avec délai
#!/bin/bash
# timeout.sh
# Écrit par Stephane Chazelas,
#+ et modifié par l'auteur de ce document.
INTERVALLE=5 # délai
lecture_delai() {
delai=$1
nomvariable=$2
ancienne_configuration_tty=`stty -g`
stty -icanon min 0 time ${delai}0
eval read $nomvariable # ou simplement read $nomvariable
stty "$ancienne_configuration_tty"
# Voir la page man de "stty".
}
echo; echo -n "Quel est votre nom ? Vite !"
lecture_delai $INTERVALLE votre_nom
# Ceci pourrait ne pas fonctionner sur tous les types de terminaux.
#+ Le temps imparti dépend du terminal (il est souvent de 25,5 secondes).
echo
if [ ! -z "$votre_nom" ] # Si le nom est entré avant que le temps ne se soit
#+ écoulé...
then
echo "Votre nom est $votre_nom."
else
echo "Temps écoulé."
fi
echo
# Le comportement de ce script diffère un peu de "timed-input.sh".
# À chaque appui sur une touche, le compteur est réinitialisé.
exit 0
Peut-être que la méthode la plus simple est d'utiliser l'option -t de read.
Les variables revisitées
78
Exemple 9.4. read avec délai
#!/bin/bash
# t-out.sh
# Inspiré d'une suggestion de "syngin seven" (merci).
LIMITETEMPS=4 # Quatre secondes
read -t $LIMITETEMPS variable <&1
# ^^^
# Dans ce cas, "<&1" est nécessaire pour Bash 1.x et 2.x,
# mais inutile pour Bash 3.x.
echo
if [ -z "$variable" ] # Est nul ?
then
echo "Temps écoulé, la variable n'est toujours pas initialisée."
else
echo "variable = $variable"
fi
exit 0
$UID
Numéro de l'identifiant utilisateur.
Numéro d'identification de l'utilisateur actuel, comme enregistré dans /etc/passwd.
C'est l'identifiant réel de l'utilisateur actuel, même s'il a temporairement endossé une autre identité avec su. $UID est une variable en lecture seule, non sujette au changement à partir de la ligne de commande ou à l'intérieur d'un script, et est la contrepartie de l'intégré id.
Exemple 9.5. Suis-je root ?
#!/bin/bash
# am-i-root.sh: Suis-je root ou non ?
ROOT_UID=0 # Root a l'identifiant $UID 0.
if [ "$UID" -eq "$ROOT_UID" ] # Le vrai "root" peut-il se lever, s'il-vous-plaît ?
then
echo "Vous êtes root."
else
echo "Vous êtes simplement un utilisateur ordinaire (mais maman vous aime tout
autant)."
fi
exit 0
# ============================================================================= #
# Le code ci-dessous ne s'exécutera pas, parce que le script s'est déjà arrêté.
# Une autre méthode d'arriver à la même fin :
NOM_UTILISATEURROOT=root
nomutilisateur=`id -nu` # Ou... nomutilisateur=`whoami`
if [ "$nomutilisateur" = "$NOM_UTILISATEURROOT" ]
then
echo "Vous êtes root."
else
echo "Vous êtes juste une personne ordinaire."
fi
Les variables revisitées
79
3Les mots « argument » et « paramètre » sont souvent utilisés sans distinction. Dans le contexte de ce document, ils ont exactement la même signification, celle d'une variable passée à un script ou à une
fonction.
Voir aussi l'Exemple 2.3, « cleanup : Une version améliorée et généralisée des scripts précédents ».
Note
Les variables $ENV, $LOGNAME, $MAIL, $TERM, $USER et $USERNAME ne sont pas des variables intégrées156
à Bash. Néanmoins, elles sont souvent initialisées comme variables d'environnement dans un des fichiers de
démarrage de Bash. $SHELL, le nom du shell de connexion de l'utilisateur, peut être configuré à partir de /
etc/passwd ou dans un script d'« initialisation », et ce n'est pas une variable intégrée à Bash.
tcsh% echo $LOGNAME
bozo
tcsh% echo $SHELL
/bin/tcsh
tcsh% echo $TERM
rxvt
bash$ echo $LOGNAME
bozo
bash$ echo $SHELL
/bin/tcsh
bash$ echo $TERM
rxvt
Paramètres de position
$0, $1, $2, etc.
Paramètres de positions, passés à partir de la ligne de commande à un script, passés à une fonction, ou initialisés (set) à une
variable (voir l'Exemple 4.5, « Paramètres positionnels » et l'Exemple 14.16, « Utiliser set avec les paramètres de position »)
$#
Nombre d'arguments sur la ligne de commande 3
ou de paramètres de position (voir l'Exemple 33.2, « Un script d'appel légèrement plus complexe »)
$*
Tous les paramètres de position, vus comme un seul mot.
Note
"$*" doit être entre guillemets.
$@
Identique à $*, mais chaque paramètre est une chaîne entre guillemets, c'est-à-dire que les paramètres sont passés de manière
intacte, sans interprétation ou expansion. Ceci signifie, entre autres choses, que chaque paramètre dans la liste d'arguments est
vu comme un mot séparé.
Note
Bien sûr, "$@" doit être entre guillemets.
Exemple 9.6. arglist : Affichage des arguments avec $* et $@
#!/bin/bash
# arglist.sh
# Appelez ce script avec plusieurs arguments, tels que "un deux trois".
Les variables revisitées
80
E_MAUVAISARGS=65
if [ ! -n "$1" ]
then
echo "Usage: `basename $0` argument1 argument2 etc."
exit $E_MAUVAISARGS
fi
echo
index=1 # Initialise le compteur.
echo "Liste des arguments avec \"\$*\" :"
for arg in "$*" # Ne fonctionne pas correctement si "$*" n'est pas entre
guillemets.
do
echo "Arg #$index = $arg"
let "index+=1"
done # $* voit tous les arguments comme un mot entier.
echo "Liste entière des arguments vue comme un seul mot."
echo
index=1 # Ré-initialisation du compteur.
# Qu'arrive-t'il si vous oubliez de le faire ?
echo "Liste des arguments avec \"\$@\" :"
for arg in "$@"
do
echo "Arg #$index = $arg"
let "index+=1"
done # $@ voit les arguments comme des mots séparés.
echo "Liste des arguments vue comme des mots séparés."
echo
index=1 # Ré-initialisation du compteur.
echo "Liste des arguments avec \$* (sans guillemets) :"
for arg in $*
do
echo "Argument #$index = $arg"
let "index+=1"
done # $* sans guillemets voit les arguments comme des mots séparés.
echo "Liste des arguments vue comme des mots séparés."
exit 0
Suite à un shift, $@ contient le reste des paramètres de la ligne de commande, sans le $1 précédent qui a été perdu.
#!/bin/bash
# Appelé avec ./script 1 2 3 4 5
echo "$@" # 1 2 3 4 5
shift
echo "$@" # 2 3 4 5
shift
echo "$@" # 3 4 5
# Chaque "shift" perd le paramètre $1.
# "$@" contient alors le reste des paramètres.
Le paramètre spécial $@ trouve son utilité comme outil pour filtrer l'entrée des scripts shell. La construction cat "$@" accepte l'entrée dans un script soit à partir de stdin, soit à partir de fichiers donnés en paramètre du script. Voir
l'Exemple 15.21, « rot13 : rot13, cryptage ultra-faible. » et l'Exemple 15.22, « Générer des énigmes « Crypto-Citations » ».
Les variables revisitées
81
Attention
Les paramètres $* et $@ affichent quelque fois un comportement incohérent et bizarre, suivant la configuration de $IFS.
Exemple 9.7. Comportement de $* et $@ incohérent
#!/bin/bash
# Comportement non prévisible des variables internes Bash "$*" et "$@",
#+ suivant qu'elles soient ou non entre guillemets.
# Gestion incohérente de la séparation de mots et des retours chariot.
set -- "Premier un" "second" "troisième:un" "" "Cinquième: :un"
# Initialise les arguments du script, $1, $2, etc.
echo
echo 'IFS inchangée, utilisant "$*"'
c=0
for i in "$*" # entre guillemets
do echo "$((c+=1)): [$i]" # Cette ligne reste identique à chaque instance.
# Arguments de echo.
done
echo ---
echo 'IFS inchangée, utilisant $*'
c=0
for i in $* # sans guillemets
do echo "$((c+=1)): [$i]"
done
echo ---
echo 'IFS inchangée, utilisant "$@"'
c=0
for i in "$@"
do echo "$((c+=1)): [$i]"
done
echo ---
echo 'IFS inchangée, utilisant $@'
c=0
for i in $@
do echo "$((c+=1)): [$i]"
done
echo ---
IFS=:
echo 'IFS=":", utilisant "$*"'
c=0
for i in "$*"
do echo "$((c+=1)): [$i]"
done
echo ---
echo 'IFS=":", utilisant $*'
c=0
for i in $*
do echo "$((c+=1)): [$i]"
done
echo ---
var=$*
echo 'IFS=":", utilisant "$var" (var=$*)'
c=0
for i in "$var"
Les variables revisitées
82
do echo "$((c+=1)): [$i]"
done
echo ---
echo 'IFS=":", utilisant $var (var=$*)'
c=0
for i in $var
do echo "$((c+=1)): [$i]"
done
echo ---
var="$*"
echo 'IFS=":", utilisant $var (var="$*")'
c=0
for i in $var
do echo "$((c+=1)): [$i]"
done
echo ---
echo 'IFS=":", utilisant "$var" (var="$*")'
c=0
for i in "$var"
do echo "$((c+=1)): [$i]"
done
echo ---
echo 'IFS=":", utilisant "$@"'
c=0
for i in "$@"
do echo "$((c+=1)): [$i]"
done
echo ---
echo 'IFS=":", utilisant $@'
c=0
for i in $@
do echo "$((c+=1)): [$i]"
done
echo ---
var=$@
echo 'IFS=":", utilisant $var (var=$@)'
c=0
for i in $var
do echo "$((c+=1)): [$i]"
done
echo ---
echo 'IFS=":", utilisant "$var" (var=$@)'
c=0
for i in "$var"
do echo "$((c+=1)): [$i]"
done
echo ---
var="$@"
echo 'IFS=":", utilisant "$var" (var="$@")'
c=0
for i in "$var"
do echo "$((c+=1)): [$i]"
done
echo ---
echo 'IFS=":", utilisant $var (var="$@")'
c=0
for i in $var
do echo "$((c+=1)): [$i]"
done
Les variables revisitées
83
echo
# Essayez ce script avec ksh ou zsh -y.
exit 0
# Ce script exemple par Stephane Chazelas,
# et légèrement modifié par l'auteur de ce document.
Note
Les paramètres $@ et $* diffèrent seulement lorsqu'ils sont entre guillemets.
Exemple 9.8. $* et $@ lorsque $IFS est vide
#!/bin/bash
#+ Si $IFS est initialisé mais vide,
#+ alors "$*" et "$@" n'affichent pas les paramètres de position
#+ comme on pourrait s'y attendre.
mecho () # Affiche les paramètres de position.
{
echo "$1,$2,$3";
}
IFS="" # Initialisé, mais vide.
set a b c # Paramètres de position.
mecho "$*" # abc,,
mecho $* # a,b,c
mecho $@ # a,b,c
mecho "$@" # a,b,c
# Le comportement de $* et $@ quand $IFS est vide dépend de la version de
#+ Bash ou sh.
# Personne ne peux donc conseiller d'utiliser cette «fonctionnalité» dans un
#+ script.
# Merci, Stephane Chazelas.
exit 0
Autres paramètres spéciaux
$-
Les options passées au script (en utilisant set). Voir l'Exemple 14.16, « Utiliser set avec les paramètres de position ».
Attention
Ceci était originellement une construction de ksh adoptée dans Bash et, malheureusement, elle ne semble pas
fonctionner de façon fiable dans les scripts Bash. Une utilité possible pour ceci est d'avoir un script testant luimême s'il est interactif.
$!
Identifiant du processus (PID) du dernier job ayant fonctionné en tâche de fond.
Les variables revisitées
84
TRACE=$0.log
COMMANDE1="sleep 100"
echo "Trace des PID des commandes en tâche de fond pour le script : $0" >> "$TRACE"
# Pour qu'ils soient enregistrés et tués si nécessaire.
echo >> "$TRACE"
# Commandes de trace.
echo -n "PID de \"$COMMANDE1\" : " >> "$TRACE"
${COMMANDE1} &
echo $! >> "$TRACE"
# PID de "sleep 100" : 1506
# Merci, Jacques Lederer, pour cette suggestion.
Utiliser $! pour contrôler un job :
job_qui_peut_se_bloquer & { sleep ${TIMEOUT}; eval 'kill -9 $!' &> /dev/null; }
# Force la fin d'un programme qui se comporte mal.
# Utile, par exemple, dans les scripts d'initialisation.
# Merci, Sylvain Fourmanoit, pour cette utilisation ingénieuse de la variable "!".
Ou autrement :
# Exemple de Matthew Sage.
# Utilisé avec sa permission.
DELAI=30 # Délai d'attente en secondes
nombre=0
job_qui_peut_se_bloquer & {
while ((nombre < DELAI )); do
eval '[ ! -d "/proc/$!" ] && ((count = TIMEOUT))'
# /proc est l'endroit où sont disponibles des informations
#+ sur les processus en cours d'exécution.
# "-d" teste si le répertoire existe.
# Donc, nous attendons que le job en question se manifeste.
((nombre++))
sleep 1
done
eval '[ -d "/proc/$!" ] && kill -15 $!'
# Si le job est en cours d'exécution, tuons-le.
}
$_
Variable spéciale initialisée avec le dernier argument de la dernière commande exécutée.
Exemple 9.9. Variable tiret bas
#!/bin/bash
echo $_ # /bin/bash
# Simple appel de /bin/bash pour lancer ce script.
du >/dev/null # Donc pas de sortie des commandes
echo $_ # du
ls -al >/dev/null # Donc pas de sortie des commandes
echo $_ # -al (dernier argument)
:
echo $_ # :
Les variables revisitées
85
$?
Code de sortie43 d'une commande, d'une fonction344 ou du script lui-même (voir l'Exemple 23.7, « Maximum de deux
nombres »)
$$
Identifiant du processus du script lui-même. La variable $$ trouve fréquemment son utilité dans les scripts pour construire
des noms de fichiers temporaires « uniques » (voir l'Exemple A.13, « ftpget: Télécharger des fichiers via ftp »,
l'Exemple 29.6, « Nettoyage après un Control-C », l'Exemple 15.28, « Déballer une archive rpm » et l'Exemple 14.27, « Un
script qui se tue lui-même »). Ceci est généralement plus simple que d'appeler mktemp.
```

# Filter A tester et à filter
Faire recherche 
- a tester
- à tester
- a filter
- to filter
...

# Wget
- `WGet [LIEN]`
  - `Wget -O '[LIEN]'`
  - `wget -O [PATH] '[LIEN]'`
  - Exemple `wget -O /scripts/sh/setup.mysql.sh 'https://raw.githubusercontent.com/Altherneum/server/main/scripts/sh/setup.mysql.sh'`

# Tar
tar -zxf [FILE]
tar -zxf [FILE] -C [PATH]
-x pour extraire

# Domaine AD
AD DS (Entra ID / Azure ID)
Objet
UO
Domaine
Forêt (Qui est : Tenant(Locataire)??? / Annuaire)



# Local key
Get-PSDrive

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
Alias                                  Alias
C                 161,49         61,48 FileSystem    C:\                                                     Users\User
Cert                                   Certificate   \
Env                                    Environment
Function                               Function
G                   4,39         10,61 FileSystem    G:\
HKCU                                   Registry      HKEY_CURRENT_USER
HKLM                                   Registry      HKEY_LOCAL_MACHINE
Variable                               Variable
WSMan                                  WSMan

# local key list
ls hkcu:
ls hklm:







# Disques 
- DAS direct access storage (Direct Attached Storage est le terme utilisé pour un système de disque dur en attachement direct, par opposition au NAS qui est en attachement réseau)
- SAS Serial Attached SCSI (technique d'interface pour disques durs, elle constitue une évolution des bus SCSI)
- NAS Network Attached Storage (serveur de fichiers autonome, relié à un réseau)
- SAN storage area network (est un réseau spécialisé permettant de mutualiser des ressources de stockage, système de stockage en block (Exemple 64Ko))


# To finish
Finir docker swarm
Move azure images to asset

# JS detect leave & reopen page tab
[medium.com/@duduHonorato](https://medium.com/@duduHonorato/detect-when-user-switches-browser-tabs-using-pure-javascript-without-any-library-085c87683f6d)

# 3D Donut
- [Article](https://www.a1k0n.net/2011/07/20/donut-math.html)
- [JS](https://www.a1k0n.net/js/donut.js)

- [Another JS](https://github.com/EvanZhouDev/TheDonutProject/blob/main/donuts/donut.js)
- [JSFuckery](https://github.com/EvanZhouDev/TheDonutProject/blob/main/donuts/donut.jsfuck.js)

# BSKy
[bsky](https://bsky.app/)

# Rosetta Code
[Rosettacode org](https://rosettacode.org/wiki/Rosetta_Code)
[2048 exemple](https://rosettacode.org/wiki/2048)
[Java list](https://rosettacode.org/wiki/Category:Java)

# JS excel wrap
- [Moz Dev Table](https://developer.mozilla.org/fr/docs/Web/HTML/Element/table)
- [Stackoverflow Export](https://stackoverflow.com/questions/22317951/export-html-table-data-to-excel-using-javascript-jquery-is-not-working-properl)
- [Phppot Convert](https://phppot.com/javascript/convert-html-table-excel-javascript/)
- [Stackoverflow Convert](https://stackoverflow.com/questions/70304838/convert-excel-sheet-data-to-html-with-javascript)

# ⌛
# Proposition de mise à niveau
## Documentation

### Reprise des documentations en format ouvert
- Reprendre les documentations
  - Attribuer quelqu'un qui passera plus de temps dessus

### Création d'un CI / CD régulier
#### Rerpise de documentation ancienne
- Reprendre des documentations par dates anti chronologiques et valider la procédure ou la recréer
#### Modification du CI actuel administratif
- Trouver un canal mail Manager, DSI et autre afin de signaler chaque mise à jour de procédure
- Créer un document sur l'endroit où les déposer
- Créer un workflow
  - Différence entre chaques updates
  - Message et vérification des versions
#### Regrouper et placer en silot les procédures
- Wiki
- Ivanti (Consignes)
- Ivanti (Historiques de ticket)
- Procédure en ligne
- Autre SharePoint séparés (fork de fichier possible ?)
- Procédure orales sans écrits

### Tests aléatoires
- Créer une vérification via un choix d'incident et de client aléatoire afin de valider et tester les procédures

### Création de contrat = procédure...
Voire le cas du 13/05 suite à un appel ou l'administrateur à indiqué ne pas connaitre le contrat et indiquer que cela semble être le mauvais n° de téléphone

### Test des 5 cliques
- Plus de 5 cliques pour trouver une procédure ou une information = 💩
- Créer des règles d'architectures
- Créer une image représentative (voire les architectures que je permet en folder imbriqués)

### Test du newb
Faire prendre quelqu'un de non technicien, et un technicien, les deux ne doivent pas connaitre le sujet, et le traiter sans aucune aide afin de valider si la façon de faire est viable

### Stock sur demande
- Attribuer 2 à 4 utilisateurs permits au stock
- Toutes actions liés au stock doivent passer par eux, permettant de réguler et savoir qui trash le stock ou pique dedans 🤣

### Création d'un plan d'architecture
- Silot (équipe, entreprise)
- Clients (Liste, contrats, type d'incident, GLPI vs Ivanti, bastion et notes)
  - Liens vers les actions techniques aux choix
  - Adresses mails, équipes techniques
  - Liens vers les Silot d'équipes concernés
- Actions techniques
  - Liste complète (voire les cours que je peut stocker :shush it:)
- Liste des applications, URL et endpoint
  - Liste aussi qui les gères (Ex: VPN, DNS(Avocats :shush it too:), ...)
- Plan réseau comme d'hab car on l'a même pas mdr (on aurais au moins le plan des bastions et rebonds)