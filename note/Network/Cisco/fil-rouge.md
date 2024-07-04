# To do
## Routeur
- Routage
- Avant dernière adresse pour les switchs du VLAN management 99 & 100
- `encapsulation dot1Q 20`

## Switch
- IP
- `switchport mode trunk`
- `switchport trunk encapsulation dot1q`
# Configuration
## Routeur A
```
enable
configure terminal

hostname RTR-A

service password-encryption
security password min-length 10
enable secret SuperUser11



vlan 10
name Direction
exit
interaface interface gigabitEthernet 0/0.10
ip address 172.16.32.94 255.255.255.240
no shutdown
switchport mode access
switchport access vlan 10
ip address dhcp
exit
ip dhcp pool R1-Pool-10
network 172.16.32.80 255.255.255.240
default-router 172.16.32.94
exit

vlan 30
name Commercial
exit
interaface interface gigabitEthernet 0/0.30
ip address 172.16.32.78 255.255.255.240
no shutdown
switchport mode access
switchport access vlan 30
ip address dhcp
exit
ip dhcp pool R1-Pool-30
network 172.16.32.64 255.255.255.240
default-router 172.16.32.78
exit

vlan 50
name Informatique
exit
interaface interface gigabitEthernet 0/0.50
ip address 172.16.32.110 255.255.255.240
no shutdown
switchport mode access
switchport access vlan 50
ip address dhcp
exit
ip dhcp pool R1-Pool-50
network 172.16.32.96 255.255.255.240
default-router 172.16.32.110
exit

vlan 99
name Management-A
exit
interaface interface gigabitEthernet 0/0.99
ip address 172.16.32.134 255.255.255.248
no shutdown
switchport mode access
switchport access vlan 99
ip address dhcp
exit
ip dhcp pool R1-Pool-99
network 172.16.32.128 255.255.255.248
default-router 172.16.32.134 255.255.255.248
exit



username admin password SuperUser11
ip domain-name m2i.labo
crypto key generate rsa modulus 1024
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


vlan 20
name RH
exit
interaface interface gigabitEthernet 0/0.20
ip address 172.16.32.126 255.255.255.248
no shutdown
switchport mode access
switchport access vlan 20
ip address dhcp
exit
ip dhcp pool R1-Pool-20
network 172.16.32.120 255.255.255.248
default-router 172.16.32.126
exit

vlan 40
name Comptabilite
exit
interaface interface gigabitEthernet 0/0.40
ip address 172.16.32.118 255.255.255.248
no shutdown
switchport mode access
switchport access vlan 40
ip address dhcp
exit
ip dhcp pool R1-Pool-40
network 172.16.32.112 255.255.255.248
default-router 172.16.32.118
exit

vlan 60
name Operations
exit
interaface interface gigabitEthernet 0/0.60
ip address 172.16.32.62 255.255.255.192
no shutdown
switchport mode access
switchport access vlan 60
ip address dhcp
exit
ip dhcp pool R1-Pool-60
network 172.16.32.0 255.255.255.192
default-router 172.16.32.62
exit

vlan 100
name Management-B
exit
interaface interface gigabitEthernet 0/0.100
ip address 172.16.32.142 255.255.255.248
no shutdown
switchport mode access
switchport access vlan 100
ip address dhcp
exit
ip dhcp pool R1-Pool-100
network 172.16.32.136 255.255.255.248
default-router 172.16.32.142
exit



username admin password SuperUser11
ip domain-name m2i.labo
crypto key generate rsa modulus 1024
line vty 0 4
login local
transport input ssh
```