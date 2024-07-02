# Router on a Stick
Cette méthode utilise un routeur avec une seule interface physique qui gère plusieurs sous-interfaces, chacune étant associée à un VLAN différent.
Configuration de Router on a Stick

## Configurer les VLANs sur le commutateur
- `enable`
- `configure terminal`
- `vlan 10`
- `name Sales`
- `exit`
- `vlan 20`
- `name Engineering`
- `exit`

## Attribuer les VLANs aux interfaces
- `interface range fa0/1 - 2`
- `switchport mode access`
- `switchport access vlan 10`
- `exit`
- `interface range fa0/3 - 4`
- `switchport mode access`
- `switchport access vlan 20`
- `exit`

## Configurer une interface trunk entre le commutateur et le routeur
- `interface fa0/5`
- `switchport mode trunk`
- `switchport trunk encapsulation dot1q`
- `exit`

## Configurer le routeur avec des sous-interfaces pour chaque VLAN
- `enable`
- `configure terminal`
- `interface fa0/0.10`
- `encapsulation dot1Q 10`
- `ip address 192.168.10.1 255.255.255.0`
- `exit`
- `interface fa0/0.20`
- `encapsulation dot1Q 20`
- `ip address 192.168.20.1 255.255.255.0`
- `exit`

## Configurer des routes statiques (optionnel)
Si vous avez besoin de routage statique supplémentaire
- `ip route 192.168.10.0 255.255.255.0 fa0/0.10`
- `ip route 192.168.20.0 255.255.255.0 fa0/0.20`
