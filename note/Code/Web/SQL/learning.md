# Notes MySQL
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
- source : [thegeekstuff.com/2008/09/backup-and-restore-mysql-database-using-mysqldump/#more-184](https://www.thegeekstuff.com/2008/09/backup-and-restore-mysql-database-using-mysqldump/#more-184)
- source : [dev.mysql.com/doc/refman/8.3/en/getting-information.html](https://dev.mysql.com/doc/refman/8.3/en/getting-information.html)
- source : [linuxize.com/post/how-to-show-databases-in-mysql/](https://linuxize.com/post/how-to-show-databases-in-mysql/)
- source : [linuxtricks.fr/wiki/mysql-sauvegarder-et-restaurer-ses-bases-de-donnees](https://www.linuxtricks.fr/wiki/mysql-sauvegarder-et-restaurer-ses-bases-de-donnees)
