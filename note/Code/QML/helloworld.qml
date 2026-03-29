import Quickshell
import QtQuick

FloatingWindow {
    visible: true
    width: 200
    height: 100
    color: "#50FFFFFF"

    Text {
        anchors.centerIn: parent
        text: "Hello LiveScript (Yeah OG name of JS) !"
        color: "#000000"
        font.pixelSize: 24
    }
}