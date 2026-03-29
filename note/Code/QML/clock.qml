import Quickshell
import QtQuick

FloatingWindow {
    visible: true
    width: 200
    height: 100
    color: "#00FFFFFF"

    Text {
        id: clock
        anchors.centerIn: parent
        text: ""
        color: "#FFFFFF"
        font.pixelSize: 30
    }

    Timer {
        repeat: true
        interval: 500
        running: true
        onTriggered: clock.text = "⏰ " + new Date(); 
    }
}