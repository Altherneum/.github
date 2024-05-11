# Notes MySQL
## Lancer des commandes SQL
### Mode interactif
```
mysql
```
Permet de lancer le mode interactif sur l'invité de commande
- Exemple : [# Modifier un utilisateur](#Modifier-un-utilisateur)
La console affichera `mysql > ` pour signaler le mode interactif

#### Quitter le mode interactif
- Quitter le mode interactif avec les commandes `exit`, `quit` ou `bye`.
- Quitter le mode interactif avec les raccourcis `Ctrl` + `Z` ou `Ctrl` + `C` ou `Ctrl` + `D`

### Commande directe
```
mysql {Commande}
```
Permet de lancer directement la commande SQL
- Exemple : [# reup-une-base-sql](#reup-une-base-sql)

### Lancer une commande avec un autre utilisateur
```
mysql -u [user] -p[password] {Commande}
```
Permet de lancer des commandes en tant que l'utilisateur `user` et avec le mot de passe de l'argument `password`

## Afficher des tableaux
### Affiche toutes les bases SQL
```
mysql> SHOW DATABASES;
```

### Synonyme de "SHOW DATABASES"
```
mysql> SHOW SCHEMAS;
```

### Affiche toutes les tables de la base SQL
```
mysql> SHOW TABLES;
```

### Créer une base SQL
```
mysql> create database [database_name];
```

## Backup
### Export / Backup une base SQL
```
mysqldump -u root -p[root_password] [database_name] > [file_name].sql
```

### Export plusieurs bases SQL
```
mysqldump -u root -p[root_password] --databases [database_name] [database_name] [...] > [file_name].sql
```

### Exporter toutes les bases SQL
```
mysqldump -u root -p[root_password] --all-databases > [file_name].sql
```

### Reup une base SQL
```
mysql -u root -p[root_password] [database_name] < [file_name].sql
```

## Modifier un utilisateur
### Modifie le mot de passe de l'utilisateur
```
mysql> ALTER USER '[user]'@'[host]' IDENTIFIED BY '[password]';
```

### Modifie le privilège de l'utilisateur
```
mysql> GRANT ALL PRIVILEGES ON [database_name].* TO '[user]'@'[host]' WITH GRANT OPTION;
```

### Source
- [thegeekstuff.com/2008/09/backup-and-restore-mysql-database-using-mysqldump/#more-184](https://www.thegeekstuff.com/2008/09/backup-and-restore-mysql-database-using-mysqldump/#more-184)
- [dev.mysql.com/doc/refman/8.3/en/getting-information.html](https://dev.mysql.com/doc/refman/8.3/en/getting-information.html)
- [linuxize.com/post/how-to-show-databases-in-mysql/](https://linuxize.com/post/how-to-show-databases-in-mysql/)
- [linuxtricks.fr/wiki/mysql-sauvegarder-et-restaurer-ses-bases-de-donnees](https://www.linuxtricks.fr/wiki/mysql-sauvegarder-et-restaurer-ses-bases-de-donnees)
- [superuser.com/questions/629709/how-to-exit-mysql-command-prompt](https://superuser.com/questions/629709/how-to-exit-mysql-command-prompt)
