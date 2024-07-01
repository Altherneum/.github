# VLAN
## Liste des commandes
- `show vlan brief`
- `show interfaces trunk`
- `show vlan id [vlan_id]`
- `vlan [VLAN_ID]`
- `name [vlan_name]`
- `switchport mode access`
- `switchport access vlan [vlan_id]`
- `switchport mode trunk`
- `switchport trunk encapsulation dot1q`
- `switchport trunk allowed vlan [vlan_list]`

## Créer VLAN
Sur le mode configuration d'un switch / routeur :
- `enable`
- `configure terminal`
- `vlan [vlan_id]` (Identifiant unique du VLAN)
  - `vlan 10`
- `name [vlan_name]` (Nom générique du VLAN)
  - `name Serveur`

## Placer une interface sur un VLAN
Pour attribuer une interface dans un VLAN
- `enable`
- `configure terminal`
- `interface [interface_type] [interface_id]` (interface à placer dans le VLAN)
  - `interface fastEthernet 0/1`
- `switchport mode access`
- `switchport access vlan [vlan_id]`
  - `switchport access vlan 10`

L'interface ne pourra communiquer que avec d'autres interfaces du même VLAN

## Multi-réseau
Deux switchs, chacun avec un PC dans un vlan
### Switch 1
- `enable`
- `configure terminal`
- `vlan [vlan_id]`
  - `vlan 10`
- `name [vlan_name]`
  - `name Serveur`
- `interface [interface_type] [interface_id]` (interface relier au PC)
  - `interface fastEthernet 0/1`
- `switchport mode access`
- `switchport access vlan [vlan_id]`
  - `switchport access vlan 10`
  
### Switch 2
Sur le second switch, retaper les mêmes commandes que sur le [Switch 1](#Switch-1)
### Explications
Les vlans ne peuvent pas encore communiquer entre eux
Il va falloir les lier ensembles
### Relier les switchs
Tirer un câble pour relier les deux switchs / routeurs, et sur leurs interfaces communes :
- `enable`
- `configure terminal`
- `interface [interface_type] [interface_id]` (interface commune aux deux switchs / routeurs)
  - `interface fastEthernet 0/1`
- `switchport mode access`
- `switchport access vlan [vlan_id]`
  - `switchport access vlan 10`

Les deux switch peuvent faire communiquer les VLAN identique entre eux

## Mode Trunk
Pour permettre à un switch de transporter le trafic de plusieurs VLAN sur une seule interface physique, vous configurez un port en mode trunk :
- `enable`
- `configure terminal`
- `interface [interface_type] [interface_id]` (interface à passer en mode trunk)
  - `interface fastEthernet 0/1`
- `switchport mode trunk`
- `switchport trunk encapsulation dot1q`
- `switchport trunk allowed vlan [vlan_list]`
  - `switchport trunk allowed vlan 10`
  - `switchport trunk allowed vlan 10,20`