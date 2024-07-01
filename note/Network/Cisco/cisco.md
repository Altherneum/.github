# Cisco packet tracer
## Câbles
### Câble croisé
Pour appareil même niveau OSI (Switch vers switch)
### Câble droit
Pour appareil de niveau différents (PC vers switch)
### Câble console
Permet de se connecter à l'appareil et envoyer des commandes
- Interface console sur le routeur / switch
- Et Interface RS 232 sur le PC
## Cisco
### Commandes
- Touche TAB = auto complete
- `?` Affiche les commandes

#### Mode configuration
- `enable` Passe en mode Super user
- `configure terminal` Passe en mode configuration
- `interaface [interface_type] [interface_type] [interface_id]` Passe sur l'interface Ethernet 0/1
  - `interaface gigabitEthernet 0/1`
- `enable`, `configure terminal`, puis `interface gigabitEthernet 0/1` Dans l'ordre pour passer à la configuration de l'interface 0/1

#### Activer une interface
- `no shutdown` Passe de carte inactive à active

#### Configurer une adresse IP sur une 
- `ip address [IP] [Masque]` Change l'addresse IP de l'interface Ethernet en cours de configuration
  - `ip address 192.168.20.254 255.255.255.0`

#### Quitter
- `exit` quite le mode actuel
- `end` quite le mode actuel

#### Sauvegarder
- `write` sauvegarde la configuration

#### Reset
- `default interface gi 1/1` Réstaure l'interface
- `no ip address` Réstaure l'IP