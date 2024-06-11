# IP & masque réseau
- Voire [cours IP](https://doc.altherneum.fr/cours/ip)
- [Cours réseau](https://doc.altherneum.fr/cours/network)

## Transformer en binaire
Pour calculer une adresse IP avec son masque on transforme les deux valeurs en binaire
```
192       . 168       . 1         . 116
1100 0000 . 1010 1000 . 0000 0001 . 0111 0100

255       . 255       . 255       . 0
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
```

### Lecture des adresses réseau et client
On peut déjà déterminer l'adresse réseau et l'adresse des postes de ce réseau
```
  1100 0000 . 1010 1000 . 0000 0001 . 0111 0100
+ 1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
= { Adresse . réseau    .         } . { PC     }
```

### Porte logique ET
Par la suite on applique un ET logique  
(Attention on ne fait pas une addition mais une porte logique ET)
```
1 + 1 = 1
1 + 0 = 0
0 + 1 = 0
0 + 0 = 0
```

Ce qui donne
```
  1100 0000 . 1010 1000 . 0000 0001 . 0111 0100
+ 1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
= 1100 0000 . 1010 1000 . 0000 0001 . 0000 0000
```

```
1100 0000 . 1010 1000 . 0000 0001 . 0000 0000
192       . 168       . 1         . 0

192.168.1.0 est l'adresse réseau
L'adresse IP et masque : 192.168.1.116/24
```

# Octets vs Bits vs Bytes
- Bit = 1 ou 0
- Byte est la quantité de donnée

- Exemple 8 bytes font un octet composés de bits

- Les bits ne sont pas utilisés pour représenter les capacités de stockage
- Un Byte, quant à lui, est la plus petite quantité de données et désigne une unité de mémoire
- Un octet s'écrit avec 8 bits
- Une image d'un octet pèse donc 8 bytes 