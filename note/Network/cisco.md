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
- `enable` Passe en mode Super user
- `configure terminal` Passe en mode configuration
- `interaface gigabitEthernet 0/1` Passe sur l'interface Ethernet 0/1

- `enable`, `configure terminal`, puis `interface gigabitEthernet 0/1` Dans l'ordre pour passer à la configuration de l'interface 0/1

- `no shutdown` Passe de carte inactive à active

- `ip address 192.168.20.254 255.255.255.0` Change l'addresse IP de l'interface Ethernet en cours de configuration

- `exit` quite le mode actuel
- `end` quite le mode actuel

- `write` sauvegarde la configuration

- `default interface gi 1/1` Réstaure l'interface
- `no ip address` Réstaure l'IP

- `ip route 192.168.10.0 255.255.255.0 192.168.254.1` Configure le routage de l'adresse `10.0` vers `254.1`
# Routage
- Afin de router vers le réseau `172.17.0.0` le paquet va prendre le chemin suivant
![image cisco](https://github.com/Altherneum/.github/blob/main/note/assets/PacketTracer_hxJE4ozS93.png?raw=true)
- Pour créer ce routage, le `Routeur5` doit savoir ou aller
- On va donc lui indiquer que le `CopyRouteur5` connait le chemin et préciser l'interface Ethernet.
- Dans le `Routeur5` créer la route statique pour aller au réseau `172.17.0.0` via l'interface entourée du `CopyRouteur5` `(Gig0/2)`
![image cisco](https://github.com/Altherneum/.github/blob/main/note/assets/PacketTracer_nD1Ro5DoIZ.png?raw=true)
![Interface du routeur](https://github.com/Altherneum/.github/blob/main/note/assets/PacketTracer_FvUjtKC88s.png?raw=true)
## Routage intermédiaire
- Lors une route casse, nous allons devoir créer une nouvelle route afin de rediriger le traffic au bon endroit
![Image cisco avec route en moins](https://github.com/Altherneum/.github/blob/main/note/assets/PacketTracer_1LaxJbFkfa.png?raw=true)
![Image cisco bis](https://github.com/Altherneum/.github/blob/main/note/assets/PacketTracer_xEZwjLLbZI.png?raw=true)
- On va donc créer une nouvelle route statique sur le routeur `Routeur5` et le `CopyRouteur5`
- Le `Routeur5` va donc avoir une nouvelle route pour lui indiquer que le `CopyRouteur(1)` connait la route, qui lui même va rediriger vers le `CopyRouteur`
- L'inverse va être fait, le `CopyRouteur` va avoir une nouvelle route statique vers `CopyRouteur(1)` qui lui même va rediriger à son tour vers `Routeur5`