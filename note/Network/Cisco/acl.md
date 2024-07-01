# ACL
## Types d'ACL
### ACL Standard
Filtre le trafic en fonction de l'adresse IP source uniquement.

Les ACL standard sont numérotées de 1 à 99 et de 1300 à 1999.
### ACL Étendue
Filtre le trafic en fonction de l'adresse IP source et destination, le protocole, les ports source et destination, et d'autres critères.

Les ACL étendues sont numérotées de 100 à 199 et de 2000 à 2699.

## Créer une ACL
- `enable`
- `configure terminal`
- `access-list [access-list-number] [permit|deny] [IP] [wildcard-mask]`
  - `access-list 10 deny 192.168.1.0 0.0.0.255` refuse le trafic provenant du réseau `192.168.1.0`

## Appliquer l'ACL à une Interface
- `enable`
- `configure terminal`
- `interface [interface-id]`
- `ip access-group [access-list] [in|out]`
  - `ip access-group 10 in` refuse le trafic entrant de la règle n°10

## ACL étendue
- `enable`
- `configure terminal`
- `access-list [access-list-number] permit|deny [protocol] [source] [wildcard-mask] [destination] [wildcard-mask] [eq|neq|gt|lt] [port]`
  - `access-list 100 permit tcp 192.168.1.0 0.0.0.255 10.0.0.0 0.255.255.255 eq 80` Autorise le trafic `HTTP` (port `80`) provenant du réseau `192.168.1.x` vers le réseau `10.x.x.x`
- Puis appliquer l'ACL à une interface

### Notes sur le protocol
- `<0-255>` An IP protocol number
- `ahp` Authentication Header Protocol
- `eigrp` Cisco’s EIGRP routing protocol
- `esp` Encapsulation Security Payload
- `gre` Cisco’s GRE tunneling
- `icmp` Internet Control Message Protocol
- `igmp` Internet Gateway Message Protocol
- `ip` Any Internet Protocol
- `ipinip` IP in IP tunneling
- `ospf` OSPF routing protocol
- `tcp` Transmission Control Protocol
- `udp` User Datagram Protocol
### Notes sur EQ NEQ GT LT
- `eq` égal
- `neq` différent
- `gt` plus grand que
- `lt` moins grand que
### Notes sur le port
Le paramètre `port` peut être une valeur nominative ou numéraire
- de `0 à 65535` 
- `www`, `telnet`, `ftp` ...

## ACL nommée
- `enable`
- `configure terminal`
- `ip access-list [standard|extended] [name]`
  - `ip access-list standard icmp_deny`
- `[permit|deny] [conditions]`
  - `permit tcp 192.168.1.0 0.0.0.255 10.0.0.0 0.255.255.255 eq 80` Autorise le trafic du réseau `192.168.1.x` vers le réseau `10.x.x.x` sur le protocole `TCP` sur le port `80`
  - `permit any` Autorise tout le trafic
  - `deny 192.168.1.0 0.0.0.255` Refuse le trafic du réseau `192.168.1.x`
- Appliquer l'ACL à une interface