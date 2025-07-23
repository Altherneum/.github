# Screen
## Screen Help
- `-4` Resolve hostnames only to IPv4 addresses
- `-6` Resolve hostnames only to IPv6 addresses
- `-a` Force all capabilities into each window's termcap
- `-A -[r|R]` Adapt all windows to the new display width & height
- `-c file` Read configuration file instead of '.screenrc'
- `-d (-r)` Detach the elsewhere running screen (and reattach here)
- `-dmS name` Start as daemon: Screen session in detached mode
- `-D (-r)` Detach and logout remote (and reattach here)
- `-D -RR` Do whatever is needed to get a screen session
- `-e xy` Change command characters
- `-f` Flow control on, -fn = off, -fa = auto
- `-h lines` Set the size of the scrollback history buffer
- `-i` Interrupt output sooner when flow control is on
- `-l` Login mode on (update /var/run/utmp), -ln = off
- `-ls [match] ` or
- `-list` Do nothing, just list our SockDir [on possible matches]
- `-L` Turn on output logging
- `-Logfile` file Set logfile name
- `-m` ignore $STY variable, do create a new screen session
- `-O` Choose optimal output rather than exact vt100 emulation
- `-p window` Preselect the named window if it exists
- `-q` Quiet startup. Exits with non-zero return code if unsuccessful
- `-Q` Commands will send the response to the stdout of the querying process
- `-r [session]` Reattach to a detached screen process
- `-R` Reattach if possible, otherwise start a new session
- `-s shell` Shell to execute rather than $SHELL
- `-S sockname ` Name this session `<pid>.sockname` instead of `<pid>.<tty>.<host>`
- `-t title` Set title. (window's name)
- `-T term` Use term as $TERM for windows, rather than "screen"
- `-U` Tell screen to use UTF-8 encoding
- `-v` Print "Screen version 4.09.00 (GNU) 30-Jan-22"
- `-wipe [match]` Do nothing, just clean up SockDir [on possible matches]
- `-x` Attach to a not detached screen. (Multi display mode)
- `-X` Execute `<cmd>` as a screen command in the specified session
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