if [ -z "$1" ]; then
    echo
else
    xfce4-terminal --hide-menubar --hide-toolbar --hide-scrollbar --hold --execute $@
fi