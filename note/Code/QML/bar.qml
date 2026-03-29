import Quickshell
import QtQuick

PanelWindow {
    visible: true
    color: "#00FFFFFF"
    anchors.top: true
    anchors.left: true
    anchors.right: true

    Text {
        id: clock
        anchors.centerIn: parent
        text: ""
        color: "#FFFFFF"
        font.pixelSize: 30
    }

    Text {
        id: cpu
        text: "abc"
        color: "#FFFFFF"
        font.pixelSize: 14
    }

    Timer {
        repeat: true
        interval: 500
        running: true
        onTriggered: clock.text = "⏰ " + new Date(); 
    }
}