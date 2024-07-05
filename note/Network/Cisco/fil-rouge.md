# To do
## Routeur
- Routage
- Avant dernière adresse pour les switchs du VLAN management 99 & 100

- Vlan que sur switch ?
- VLan management pas d'interface
## Switch
- IP

# Configuration
## Routeur A
```
enable
configure terminal

hostname RTR-A

service password-encryption
security password min-length 10
enable secret SuperUser11



interface GigabitEthernet0/0
no shutdown

interface gigabitEthernet 0/0.10
encapsulation dot1Q 10
ip address 172.16.32.94 255.255.255.240
no shutdown

exit
ip dhcp pool R1-Pool-10
network 172.16.32.80 255.255.255.240
default-router 172.16.32.94

exit
interface gigabitEthernet 0/0.30
encapsulation dot1Q 30
ip address 172.16.32.78 255.255.255.240
no shutdown
exit
ip dhcp pool R1-Pool-30
network 172.16.32.64 255.255.255.240
default-router 172.16.32.78

exit
interface gigabitEthernet 0/0.50
encapsulation dot1Q 50
ip address 172.16.32.110 255.255.255.240
no shutdown
exit
ip dhcp pool R1-Pool-50
network 172.16.32.96 255.255.255.240
default-router 172.16.32.110

exit
interface gigabitEthernet 0/0.99
encapsulation dot1Q 99
ip address 172.16.32.134 255.255.255.248
no shutdown
exit
ip dhcp pool R1-Pool-99
network 172.16.32.128 255.255.255.248
default-router 172.16.32.134
exit



username admin password SuperUser11
ip domain-name m2i.labo
crypto key generate rsa general-keys modulus 1024
line vty 0 4
login local
transport input ssh
```

## Routeur B
```
enable
configure terminal

hostname RTR-B

service password-encryption
security password min-length 10
enable secret SuperUser11



interface GigabitEthernet0/0
no shutdown

interface gigabitEthernet 0/0.20
encapsulation dot1Q 20
ip address 172.16.32.126 255.255.255.248
no shutdown
exit
ip dhcp pool R1-Pool-20
network 172.16.32.120 255.255.255.248
default-router 172.16.32.126

exit
interface gigabitEthernet 0/0.40
encapsulation dot1Q 40
ip address 172.16.32.118 255.255.255.248
no shutdown
exit
ip dhcp pool R1-Pool-40
network 172.16.32.112 255.255.255.248
default-router 172.16.32.118

exit
interface gigabitEthernet 0/0.60
encapsulation dot1Q 60
ip address 172.16.32.62 255.255.255.192
no shutdown
exit
ip dhcp pool R1-Pool-60
network 172.16.32.0 255.255.255.192
default-router 172.16.32.62

exit
interface gigabitEthernet 0/0.100
encapsulation dot1Q 100
ip address 172.16.32.142 255.255.255.248
no shutdown
exit
ip dhcp pool R1-Pool-100
network 172.16.32.136 255.255.255.248
default-router 172.16.32.142
exit



username admin password SuperUser11
ip domain-name m2i.labo
crypto key generate rsa general-keys modulus 1024
line vty 0 4
login local
transport input ssh
```

## SW A-1 et SW A-2
```
enable
configure terminal

hostname SW-A-1

service password-encryption
enable secret SuperUser11



vlan 10
name Direction
exit

vlan 30
name Commercial
exit

vlan 50
name Informatique
exit

vlan 99
name Management-A
exit

interface range fastEthernet 0/1 - 3
switchport mode access
switchport access vlan 10

interface range fastEthernet 0/4 - 6
switchport mode access
switchport access vlan 30

interface range fastEthernet 0/7 - 9
switchport mode access
switchport access vlan 50



interface gigabitEthernet 0/2
switchport mode trunk



username admin password SuperUser11
ip domain-name m2i.labo
crypto key generate rsa general-keys modulus 1024
line vty 0 4
login local
transport input ssh
```

## SW B-1 et SW B-2
```
enable
configure terminal

hostname SW-B-1

service password-encryption
enable secret SuperUser11



vlan 20
name RH
exit

vlan 40
name Comptabilite
exit

vlan 60
name Operations
exit

vlan 100
name Management-B
exit

interface range fastEthernet 0/1 - 3
switchport mode access
switchport access vlan 20

interface range fastEthernet 0/4 - 6
switchport mode access
switchport access vlan 40

interface range fastEthernet 0/7 - 9
switchport mode access
switchport access vlan 60



interface gigabitEthernet 0/2
switchport mode trunk



username admin password SuperUser11
ip domain-name m2i.labo
crypto key generate rsa general-keys modulus 1024
line vty 0 4
login local
transport input ssh
```