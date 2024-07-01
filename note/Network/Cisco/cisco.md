# Cisco packet tracer
## Câbles
### Câble croisé
Pour appareil même niveau OSI
### Câble droit
Pour appareil de niveau différents
### Câble console
- Interface console sur le routeur / switch
- Et Interface RS 232 sur le PC
## Cisco
### Commandes
- Touche TAB = auto complete
- `?` Affiche les commandes

#### Mode configuration
- `enable` Passe en mode Super user
- `configure terminal` Passe en mode configuration
- `interaface gigabitEthernet 0/1` Passe sur l'interface Ethernet 0/1
- `enable`, `configure terminal`, puis `interface gigabitEthernet 0/1` Dans l'ordre pour passer à la configuration de l'interface 0/1

#### Activer une interface
- `no shutdown` Passe de carte inactive à active

#### Configurer une adresse IP sur une interface
- `ip address 192.168.20.254 255.255.255.0` Change l'addresse IP de l'interface Ethernet en cours de configuration

#### Quitter
- `exit` quite le mode actuel
- `end` quite le mode actuel

#### Sauvegarder
- `write` sauvegarde la configuration

#### Reset
- `default interface gi 1/1` Réstaure l'interface
- `no ip address` Réstaure l'IP

#### Vlan
- `show vlan brief`
- `vlan [VLAN_ID]`
- `name [vlan_name]`

#### Routage
- `router RIP` Active le routage RIP
- `ip route 192.168.10.0 255.255.255.0 192.168.254.1` Configure le routage de l'adresse `10.0` vers `254.1`
- `network 172.18.0.0` active le routage dynamique vers le réseau 172.18.0.0 (doit être fait sur tout les réseaux)

- `show running-config`