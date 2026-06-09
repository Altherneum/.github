pkg update && pkg upgrade
pkg install tur-repo

apt update --fix-missing

pkg install git
git clone https://github.com/Altherneum/.github
git clone https://github.com/Altherneum/plugin
git clone https://github.com/Altherneum/server
git clone https://github.com/Altherneum/bot
git clone https://github.com/Altherneum/altherneum.github.io

git config --global user.email "9j2k37st@gmail.com"
git config --global user.name "lx78WyY0J5"

pkg install code-server
code-server --auth none

