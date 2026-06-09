pkg update && pkg upgrade
pkg install tur-repo

apt update --fix-missing

pkg install git
git clone https://github.com/Altherneum/.github
git clone https://github.com/Altherneum/plugin
git clone https://github.com/Altherneum/server
git clone https://github.com/Altherneum/bot
git clone https://github.com/Altherneum/altherneum.github.io

pkg install code-server
code-server --auth none