# LVM
- LVM (Logical Volume Manager, ou gestionnaire de volumes logiques en français) 
- Permet la création et la gestion de volumes logiques sous Linux (remplace en quelque sorte le partitionnement des disques)
- Il permet notamment de redimensionner les partitions de disques sans reformatage
- Il permet également de rajouter des disques à la volée

- ![image de doc.ubuntu-fr.org sur lvm](https://doc.ubuntu-fr.org/_media/lvm.jpg)

## Liens
- [it-connect.fr/chapitres/decouverte-du-lvm](https://www.it-connect.fr/chapitres/decouverte-du-lvm/)
- [doc.ubuntu-fr.org/lvm](https://doc.ubuntu-fr.org/lvm)
- [wiki.debian.org/fr/LVM](https://wiki.debian.org/fr/LVM)

- [debian.org/releases/stable/i386/apcs04.fr](https://www.debian.org/releases/stable/i386/apcs04.fr.html)

## Définitions
- PV : Volume Physique. Les disques durs, partitions de disques durs, volumes RAID ou unités logiques provenant d'un SAN forment des "volumes physiques" (physical volumes ou PV)
- VG : Groupe de Volumes. C'est un assemblage d'un ou plusieurs Volumes Physiques (PV)
- LV : Volume logique. Les LV redécoupent les Groupes de Volumes sous forme de partition virtuelle
- PE : pour être manipuler, les données sont divisées en blocs de données appelé extensions physiques (Physical Extents)
- LE : même chose que pour les PE mais au niveau logique (Logical Extent). La taille des blocs est la même dans pour chaque volume logique (LV) d'un même groupe de volume (VG)
- Labels: Vous devriez utiliser les noms ou labels des volumes logiques (LV) dans /etc/fstab pour les identifier, plutôt que les UUID ou les règles de nommage du noyau (/dev/sda) afin d'éviter les conflits avec la restauration d'images des volumes (snapshots).

## Liste de commandes LVM
### Installation
- `apt-get install lvm2` Installer le paquet lvm2
- `/etc/init.d/lvm start` Démarrer le service lvm
### Commandes LVM
- `lvmchange` Changer les attributs de LVM
- `lvmdiskscan` Analyser tout les supports visibles par LVM2
- `lvmdump` Créer une copie des informations de lmv2 pour des besoins de diagnostic
### Commandes PV
- `pvchange` Changer les attributs d'un volume physique
- `pvck` Vérifier les métadonnées d'un volume physique
- `pvcreate` Initialiser un disque ou un partition pour être utilisés par LVM
- `pvdisplay` Afficher les attributs d'un volume physique
- `pvmove` Déplacer les extensions physiques (PE)
- `pvremove` Supprimer un volume physique
- `pvresize` Redimensionner un disque ou une partition en utilisant LVM2
- `pvs` Remonter les informations à propos des volumes physiques
- `pvscan` Analyser tous les disques des volumes physiques
### Commandes VG
- `vgcfgbackup` Sauvegarder la section qui décrit les groupes de volumes
- `vgcfgrestore` Restaurer la section qui décrit les groupes de volumes
- `vgchange` Changer les attributs d'un groupe de volumes
- `vgck` Vérifier les métadonnées d'un groupe de volumes
- `vgconvert` Convertir le format des métadonnées d'un groupe de volumes
- `vgcreate` Créer un groupe de volumes
- `vgdisplay` Afficher les attributs des groupes de volumes
- `vgexport` Rendre les groupes de volumes inconnus du système
- `vgextend` Ajouter un volume physique à un groupe de volumes
- `vgimport` Faire connaître les groupes de volumes exportés auprès du système
- `vgimportclone` Importer et renommer un groupe de volumes dupliqué (ex: une image disque)
- `vgmerge` Fusionner deux groupes de volumes
- `vgmknodes` Recreate Volume Group directory and Logical Volume special files
- `vgreduce` Réduire un groupe de volumes en supprimant un, ou plus, volume physique
- `vgremove` Supprimer un groupe de volumes
- `vgrename` Supprimer un groupe de volumes
- `vgs` Remonter les informations à propos des groupes de volumes
- `vgscan` Analyser tout les disques des groupes de volume et reconstruisez les caches
- `vgsplit` Split a Volume Group into two, moving any logical volumes from one Volume Group to another by moving entire Physical Volumes
### Commandes LV
- `lvchange` Changer les attributs d'un volume logique
- `lvconvert` Convert a Logical Volume from linear to mirror or snapshot
- `lvcreate` Créer un volume logique dans un volume groupe existant
- `lvdisplay` Afficher les attributs d'un volume logique
- `lvextend` Étendre la taille d'un volume logique
- `lvreduce` Réduire la taille d'un volume logique
- `lvremove` Supprimer un volume logique
- `lvrename` Renommer un volume logique
- `lvresize` Redimensionner un volume logique
- `lvs` Remonter les informations à propos des volumes logiques
- `lvscan` Analyser (tout les disques) les volumes logiques

### Créer un Persistent Volumes
PV : Volumes Physiques (Persistent Volumes)
#### Créer un PV
- `pvcreate /dev/sda2` Pour déclarer la partition /dev/sda2 comme volume physique disponible pour LVM
#### Supprimer un PV
- `pvmove /dev/sda2` Déplacer les données autre part. Assurez-vous que les autres volumes physiques contenant le même groupe de volumes possèdent assez d'espace libre
- `vgreduce [VirtualGroupName] /dev/sda2` retirer le disque du groupe de volumes (nommé ici myVirtualGroup1)
- `pvremove /dev/sda2` Pour supprimer un volume physique sur /dev/sda2

### Créer un Volume Groupe
#### Créer un VG
- `vgcreate [VirtualGroupName] /dev/sda2`
#### Étendre le groupe de volumes
- `pvcreate /dev/sda3` Déclarez un autre volume physique
- `vgextend monGroupeVirtuel1 /dev/sda3` Ajouter le nouveau PV au VG déjà existant
#### Vérifier la configuration des VG
- `vgdisplay` 

## To Do
- Vérifier via les liens [# liens](#liens)
- Test sur distro

### Doc to do
```
Volumes Logique (LV)
Créer un LV
<!> N'oubliez pas de vérifier si vous assez de place : un LV de 100Go ne rentrera pas dans un VG de 10Go.

Créez un volume logique dans un groupe de volumes :

# lvcreate -n myLogicalVolume1 -L 10g monGroupeVirtuel1
Formatez le volume logique dans le système de fichier que vous souhaitez (ext4,xfs...).

# mkfs -t ext4 /dev/monGroupeVirtuel1/monVolumeLogique1
Vous pouvez vérifier s'il fonctionne :

mkdir /test
# mount /dev/monGroupeVirtuel1/monVolumeLogique1 /test
df -h
Vous pouvez aussi vérifier vos volumes logiques avec :

# lvdisplay
Supprimer un LV
Pour supprimer un Volume Logique, assurez-vous d'abord qu'il ne soit plus utilisé. Puis utilisez simplement cette commande pour supprimer le Volume Logique monVolumeLogique1 du groupe de volumes monGroupeVirtuel1 :


# lvremove /dev/monGroupeVirtuel1/monVolumeLogique1
Il vous sera surement demande de confirmer la suppression du Volume Logique s'il est actif.CategoryL10nFrUpdate
```