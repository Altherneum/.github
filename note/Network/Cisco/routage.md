# Routage
# Routage simple
- Afin de router vers le réseau `172.17.0.0` le paquet va prendre le chemin suivant
![image cisco](https://github.com/Altherneum/.github/blob/main/note/assets/images/PacketTracer_hxJE4ozS93.png?raw=true)
- Pour créer ce routage, le `Routeur5` doit savoir ou aller
- On va donc lui indiquer que le `CopyRouteur5` connait le chemin et préciser l'interface Ethernet.
- Dans le `Routeur5` créer la route statique pour aller au réseau `172.17.0.0` via l'interface entourée du `CopyRouteur5` `(Gig0/2)`
![image cisco](https://github.com/Altherneum/.github/blob/main/note/assets/images/PacketTracer_nD1Ro5DoIZ.png?raw=true)
![Interface du routeur](https://github.com/Altherneum/.github/blob/main/note/assets/images/PacketTracer_FvUjtKC88s.png?raw=true)
## Routage intermédiaire
- Lors une route casse, nous allons devoir créer une nouvelle route afin de rediriger le traffic au bon endroit
![Image cisco avec route en moins](https://github.com/Altherneum/.github/blob/main/note/assets/images/PacketTracer_1LaxJbFkfa.png?raw=true)
![Image cisco bis](https://github.com/Altherneum/.github/blob/main/note/assets/images/PacketTracer_xEZwjLLbZI.png?raw=true)
- On va donc créer une nouvelle route statique sur le routeur `Routeur5` et le `CopyRouteur5`
- `CopyRouteur5(1)` connait déjà toutes les routes et n'aura donc aucune route à créer

- Le `Routeur5` va donc avoir une nouvelle route pour lui indiquer que le `CopyRouteur5(1)` connait la route, qui lui même va rediriger vers le `CopyRouteur5` pour aller sur le réseau `172.17.0.0`
- L'inverse va être fait, le `CopyRouteur` va avoir une nouvelle route statique vers `CopyRouteur(1)` qui lui même va rediriger à son tour vers `Routeur5` pour aller vers le réseau `172.18.0.0`
## Routage dynamique
[RIP](https://fr.wikipedia.org/wiki/Routing_Information_Protocol) vs [OSPF](https://fr.wikipedia.org/wiki/Open_Shortest_Path_First)
- `RIP (Routing Information Protocol)` sera le routage sera le chemin avec le moins de saut (Routeur)
- D'autre comme `OSPF (Open Shortest Path First)` prendront la route la plus rapide (Exemple un réseau fibré ou un réseau sans latence), plustôt que la route avec le moins de saut
### Routage RIP
- Sur le routeur : `CopyRouteur5(1)`
-  `enable ` Passe en mode Super user
- `configure terminal ` Passe en mode configuration
- `router RIP` Active le routage RIP
- `network 172.17.0.0`
- `network 192.168.3.0`
- `network 192.168.2.0` Active la découverte automatique de route dynamique vers tout ces réseaux
### Routage OSPF
Exemple sur le routeur `Routeur5` 
(R1 sur l'image) NB : à modifier avec les PKT
- `enable`
- `configure terminal`
- `router OSPF 1`
- `router-id 1.1.1.1`
- `network 10.255.255.0   0.0.0.3     area 0`
- `network 10.255.255.8   0.0.0.3     area 0`
- `network 172.16.0.0     0.0.0.255   area 0`

![cisco OSPF image](https://github.com/Altherneum/.github/blob/main/note/assets/images/ms-teams_9knjVRjsVE.png?raw=true)

Il ne crée que les branches qui lui sont rattachés