```
Router>enable 
Router#configure terminal
Router(config)#ip access-list standard icmp_srv_deny
Router(config-std-nacl)#deny 192.168.1.0 0.0.0.255
Router(config-std-nacl)#permit any
Router(config-std-nacl)#exit
Router(config)#interface gigabitEthernet 0/0.30
Router(config-subif)#ip access-group icmp_srv_deny in
Router(config-subif)#end
```

# Exemple ACL extended
``` 
Router>enable 
Router#configure terminal
Router(config)#ip access-list extended Block_Ext_Web
Router(config-ext-nacl)#[permit|deny] [ip|TCP|UDP] ip_src wilcard Port-src IP_Dest wilcard Port_Dest
Router(config-ext-nacl)#deny TCP host 10.0.0.10 192.168.2.0 0.0.0.255 eq 80
Router(config-ext-nacl)#deny TCP host 10.0.0.10 192.168.2.0 0.0.0.255 eq 443
Router(config-ext-nacl)# Permit ip any any
 
Router(config)#interface gig0/1
Router(config-if)#ip access-group Block_Ext_Web out
```