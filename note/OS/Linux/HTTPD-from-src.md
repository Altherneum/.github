# Build apache from source
## Télécharger les paquets
### Télécharger HTTPD
- `wget -O /opt/ 'https://dlcdn.apache.org/httpd/httpd-2.4.62.tar.gz'`
- `tar -xzf /opt/httpd-2.4.62.tar.gz`
- `rm /opt/httpd-2.4.62.tar.gz`
### Télécharger APR et APR-Util
#### APR
- `wget -O /opt/ 'https://dlcdn.apache.org//apr/apr-1.7.4.tar.gz'`
- `tar -xzf /opt/httpd-2.4.62/srclib/apr-1.7.4.tar.gz`
- `rm /opt/httpd-2.4.62/srclib/apr-1.7.4.tar.gz`
- `mv /opt/httpd-2.4.62/srclib/apr-1.7.4 /opt/httpd-2.4.62/srclib/apr`
#### APR-util
- `wget -O /opt/ 'https://dlcdn.apache.org//apr/apr-util-1.6.3.tar.gz'`
- `tar -xzf /opt/httpd-2.4.62/srclib/apr-util-1.6.3.tar.gz`
- `rm /opt/httpd-2.4.62/srclib/apr-util-1.6.3.tar.gz`
- `mv /opt/httpd-2.4.62/srclib/apr-util-1.6.3 /opt/httpd-2.4.62/srclib/apr-util`
### Télécharger PERL
- `wget -O /opt/ 'https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.gz'`
- `tar -xzf /opt/pcre-8.45.tar.gz`
- `rm /opt/pcre-8.45.tar.gz`
### Build essential
- `apt install build-essential`
## Compiler perl
- `cd /opt/pcre-8.45`
- `./configure`
- `make`
- `make install`
## EXPAT from APT
- `apt install libexpat1-dev`
### Expat from source
https://github.com/libexpat/libexpat#building-from-a-source-distribution
## Compiler HTTPD
- `cd /opt/httpd-2.4.62`
- `./configure --with-included-apr --with-pcre`
- `make`
- `make install`
## Star Apache HTTPD
- `usr/bin/ldconfig`
- `/usr/local/apache2/bin/apachectl -k start`
## Fichier de configuration
- `/usr/local/apache2/conf/httpd.conf`
- `usr/local/apache2/cgi-bin`
- `/usr/local/apache2/htdocs`