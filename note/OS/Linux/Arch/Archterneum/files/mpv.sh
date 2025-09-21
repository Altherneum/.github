# Exemple # /home/vscode/repo/.github/note/OS/Linux/Arch/Archterneum/files/mpv.sh getFileCount "/home/vscode/repo/.github/note/OS/Linux/Arch/Archterneum/files/backgrounds/"

getFileCount() {
    find $1 -type f -name "*.mp4" | wc -l
}

setRandomVideo() {
    FPS=30

    VideoNumber=1
    maxvideoamount=$(getFileCount ~/.config/hypr/backgrounds/)
    minvideoid=1

    VideoNumber=$(($RANDOM%($maxvideoamount-$minvideoid+1)+$minvideoid))

    pkill mpvpaper

    mpvpaper '*' -vs -l bottom -o "--no-audio --loop --panscan=1 --no-input-terminal --no-input-cursor --on-all-workspaces --container-fps-override=$FPS --ontop-level=desktop --no-correct-pts" ~/.config/hypr/backgrounds/$VideoNumber.mp4 -f
}

addNewBackground() {
    if [ -z "$1" ]; then
        echo Add an URL
    else
        newVideoID=0
        newVideoID=$(getFileCount ~/.config/hypr/backgrounds/)

        newVideoID=$(($newVideoID + 1))

        curl -o ~/.config/hypr/backgrounds/$newVideoID.mp4 $1
    fi
}

startLoop() {
    if [ -z "$1" ]; then
        echo "Need a timer in sec"
    else
        while true; do
            $(setRandomVideo)
            sleep $1
        done
    fi
}

case $1 in
    getFileCount) "$@"; exit;;
    setRandomVideo) "$@"; exit;;
    addNewBackground) "$@"; exit;;
    startLoop) "$@"; exit;;
esac