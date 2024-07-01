# Router
```
Router>enable
Router#configure terminal
Router(config)#interface g0/0
Router(config-if)#no shutdown
Router(config)#interface gigabitEthernet 0/0.10
Router(config-subif)#encapsulation dot1Q 10
Router(config-subif)#ip address 192.168.2.254 255.255.255.0
Router(config-subif)#exit
Router(config)#interface gigabitEthernet 0/0.20
Router(config-subif)#encapsulation dot1Q 20
Router(config-subif)#ip address 192.168.3.254 255.255.255.0
Router(config-subif)#exit
Router(config)#interface gigabitEthernet 0/0.30
Router(config-subif)#encapsulation dot1Q 30
Router(config-subif)#ip address 192.168.1.254 255.255.255.0
Router(config-subif)#end
Router#write
```

# Switch
```
Switch#configure terminal
Switch(config)#interface g 0/1
Switch(config-if)#switchport mode trunk
```