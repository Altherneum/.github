# Screen
## Screen Help
`screen --help`

- `-4` Résoud les noms de hostnames uniquement en IPv4 adresses
- `-6` Résoud les noms de hostnames uniquement en IPv6 adresses
- `-a` Force toutes les capacités dans chaque fenêtre du terme (capsule)
- `-A -[r|R]` Adapte automatiquement toutes les fenêtres au nouveau format d'affichage et de hauteur
- `-c file` Lit le fichier de configuration en lieu et place du fichier `.screenrc`
- `-d (-r)` Déconnecte et redémarre le écran (et le ré-attache ici)
- `-dmS name` Démarrer screen en tant que session daemon en mode détaché
- `-D (-r)` Déconnecte et se déconnecte du serveur.  Le ré-attache ici
- `-D -RR` Effectue tout ce qui est nécessaire pour démarrer une session Screen
- `-e xy` Change les caractères de commande. (Exemple `xy` pour changer le format de la commande)
- `-f` Flow control sur, -fn = off, -fa = auto
- `-h lines` Définit la taille du tampon de l'historique des commandes
- `-i` Interruption d'output plus tôt lorsque le flow control est activé
- `-l` Logement en mode login, -ln = off
- `-ls [match] ` or (Optionnel) Liste les noms de sockets
- `-list` Ne fait rien, liste simplement notre SockDir [sur possible matches]
- `-L` Active le logging
- `-Logfile` Définit le nom du fichier de journalisation
- `-m` Ignore la variable `STY` et crée une nouvelle session Screen
- `-O` Choisit un mode de sortie optimal plutôt qu'une émulation VT100 exacte
- `-p window` Sélectionnez automatiquement la fenêtre nommée si elle existe
- `-q` Redémarre le startup en mode silencieux (mise à jour du fichier `/var/run/utmp`, -ln = off)
- `-Q` Redémarre le processus si possible, sinon démarre une nouvelle session
- `-r [session]` Redémarre le processus Screen en mode "session" (détaché)
- `-R` Ré-attache si possible, sinon démarre une nouvelle session
- `-s shell` Exécute la commande plutôt que `$SHELL`
- `-S sockname` Définit le nom de la session sous forme de chemin d'accès `<pid>.sockname` au lieu de `<pid>.<tty>.<host>`
- `-t title` Définit le titre de la fenêtre. (le nom de la fenêtre)
- `-T term` Utilise le terme comme `$TERM` pour les fenêtres, au lieu de "screen"
- `-U` Utilise l'encodage UTF-8 pour le terminal
- `-v` Affiche la version du terminal Screen (GNU 4.09.00)
- `-wipe [match]` Nettoie le fichier SockDir [sur possible matches]
- `-x` Redémarre le screen en mode non attaché. (mode multi-écran)
- `-X` Exécute un autre command comme une commande Screen dans la session spécifiée
## Lister les screens
`screen -ls` Permet de lister les screen actifs
## S'attacher à un screen
`screen -r <SCREEN_ID_OR_NAME>`
## Détacher un screen
- Pour vous détacher d'un screen ouvert :
  - Pressez `CTRL` + `A` + `D`
## Fermer un screen
- `screen -XS <SCREEN_ID_OR_NAME> <CMD>`
  - Exemple : `screen -XS super_screen_name quit`
## Envoyer une commande dans screen
- `screen -S <SCREEN_ID_OR_NAME> -p 0 -X stuff "<CMD>^M"`
  - `screen -S super_screen_name -p 0 -X stuff "reload^M"` pour envoyer `reload` au screen `super_screen_name`
  - `screen -S super_screen_name -p 0 -X stuff "ban bad_guy_user_name^M"`
## Créer un screen
`screen -dmS <SCREEN_ID_OR_NAME> <CMD>`
  - `screen -dmS survie java -Xms128M -Xmx384M -Dterminal.jline=false -XX:+ParallelRefProcEnabled -Dterminal.ansi=true -DIReallyKnowWhatIAmDoingISwear -Dcom.mojang.eula.agree=true -jar /Serveurs/Survie/paper.jar nogui` Exemple pour lancer un serveur Paper avec Java