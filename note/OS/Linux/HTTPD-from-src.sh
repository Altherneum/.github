wget -O /opt/ 'https://dlcdn.apache.org/httpd/httpd-2.4.62.tar.gz'
tar -xzf /opt/httpd-2.4.62.tar.gz
rm /opt/httpd-2.4.62.tar.gz

wget -O /opt/ 'https://dlcdn.apache.org//apr/apr-1.7.4.tar.gz'
tar -xzf /opt/httpd-2.4.62/srclib/apr-1.7.4.tar.gz
rm /opt/httpd-2.4.62/srclib/apr-1.7.4.tar.gz
mv /opt/httpd-2.4.62/srclib/apr-1.7.4 /opt/httpd-2.4.62/srclib/apr

wget -O /opt/ 'https://dlcdn.apache.org//apr/apr-util-1.6.3.tar.gz'
tar -xzf /opt/httpd-2.4.62/srclib/apr-util-1.6.3.tar.gz
rm /opt/httpd-2.4.62/srclib/apr-util-1.6.3.tar.gz
mv /opt/httpd-2.4.62/srclib/apr-util-1.6.3 /opt/httpd-2.4.62/srclib/apr-util

wget -O /opt/ 'https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.gz'
tar -xzf /opt/pcre-8.45.tar.gz
rm /opt/pcre-8.45.tar.gz

apt install build-essential

cd /opt/pcre-8.45
./configure
make
make install

apt install libexpat1-dev

cd /opt/httpd-2.4.62
./configure --with-included-apr --with-pcre
make
make install

usr/bin/ldconfig

/usr/local/apache2/bin/apachectl -k start