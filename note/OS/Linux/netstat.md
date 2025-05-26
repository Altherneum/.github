# Netstat
## Afficher les sessions SSH via Netstat
So far, we’ve looked at several methods that display logged-in users. SSH sessions can also be found by looking at network connections. To do that, let’s use netstat:

$ netstat -atnp | grep 'ESTABLISHED.*sshd'
tcp        0      0 198.51.100.14:22        203.0.113.13:49570    ESTABLISHED 1674/sshd: user1@pts 
tcp        0     36 198.51.100.14:22        203.0.113.24:57586    ESTABLISHED 1894/sshd: user2@pts 
Copy
netstat will display more information than we need. Therefore, to hone in on established SSH connections, let’s use grep to filter the results. From the output, we can see that user1 and user2 are connected via SSH.

In scenarios where using commands that list logged-in users is not enough, netstat will give us a more accurate picture of active SSH sessions.