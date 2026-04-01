import QtQuick
import Quickshell
import QtQuick.Layouts
import QtQuick.Controls

PanelWindow {
    visible: true
    color: "#50000000"
    anchors.top: false
    anchors.bottom: true
    anchors.left: true
    anchors.right: true
    height: 50

    function getWithLeadingZero(value) {
        if(value<=9){
            return "0"+value;
        }
        return value;
    }

    function getDate(type){
        const date = new Date();
        if(type === "monthNum"){ return date.getMonth() + 1; }
        else if(type === "monthText") { return Qt.locale("fr_FR").standaloneMonthName(date.getMonth(), Locale.LongFormat); }
        else if(type === "dayNum"){ return date.getDate(); }
        else if(type === "dayText"){ 
           return getDay(date);
        }
        else if(type === "year"){ return date.getYear() + 1900; }
        else{ return ""; }
    }

    function getDay(date){
        var jours = ["dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"];
        var index = date.getDay();
        return jours[index].charAt(0).toUpperCase() + jours[index].slice(1);
    }

    RowLayout {
        anchors.fill: parent
        
        Text {
            Layout.leftMargin: 20
            
            id: logo
            text: "󰣇"
            font.pixelSize: 40
            color: "#FFFFFF"
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }
        
        Text {
            text: "abc"
            color: "#FFFFFF"
            font.pixelSize: 14
        }

        //DATE & HEURE
        RowLayout {
            Layout.alignment: Qt.AlignRight
            
            ColumnLayout{
                Layout.rightMargin: 20
                Layout.alignment: Qt.AlignCenter

                //DATE
                RowLayout {
                    spacing: 1
                    Layout.alignment: Qt.AlignCenter

                    Text {
                        id: dayText
                        text: getDate("dayText");
                        color: "#FFFFFF"
                        font.pixelSize: 15

                        Timer {
                            repeat: true
                            interval: 1000
                            running: true
                            onTriggered: dayText.text = getDate("dayText");
                        }
                    }

                    Text {
                        id: dayNum2
                        text: getDate("dayNum");
                        color: "#FFFFFF"
                        font.pixelSize: 15

                        Timer {
                            repeat: true
                            interval: 1000
                            running: true
                            onTriggered: dayNum2.text = getDate("dayNum")
                        }
                    }

                    Text {
                        id: month2
                        text: getDate("monthText");
                        color: "#FFFFFF"
                        font.pixelSize: 15

                        Timer {
                            repeat: true
                            interval: 1000
                            running: true
                            onTriggered: month2.text = getDate("monthText")
                        }
                    }
                }

                //DATE
                RowLayout{
                    Layout.alignment: Qt.AlignCenter
                    spacing: 2
                    Text {
                        id: dayNum1
                        text: getWithLeadingZero(getDate("dayNum"));
                        color: "#FFFFFF"
                        font.pixelSize: 15

                        Timer {
                            repeat: true
                            interval: 1000
                            running: true
                            onTriggered: dayNum1.text = getWithLeadingZero(getDate("dayNum"));
                        }
                    }

                    Text {
                        text: "/"
                        color: "#FFFFFF"
                        font.pixelSize: 15
                    }
                    
                    Text {
                        id: month1
                        text: getWithLeadingZero(getDate("monthNum"));
                        color: "#FFFFFF"
                        font.pixelSize: 15

                        Timer {
                            repeat: true
                            interval: 1000
                            running: true
                            onTriggered: month1.text = getWithLeadingZero(getDate("monthNum"));
                        }
                    }

                    Text {
                        text: "/"
                        color: "#FFFFFF"
                        font.pixelSize: 15
                    }

                    Text {
                        id: year
                        text: getDate("year");
                        color: "#FFFFFF"
                        font.pixelSize: 15

                        Timer {
                            repeat: true
                            interval: 1000
                            running: true
                            onTriggered: year.text = getDate("year")
                        }
                    }
                }
            }

            //HEURE
            RowLayout {
                spacing: 1
                Layout.rightMargin: 20

                Text {
                    id: hour
                    text: getWithLeadingZero(new Date().getHours());
                    color: "#FFFFFF"
                    font.pixelSize: 15

                    Timer {
                        repeat: true
                        interval: 1000
                        running: true
                        onTriggered: hour.text = getWithLeadingZero(new Date().getHours());
                    }
                }

                Text {
                    text: "h"
                    color: "#FFFFFF"
                    font.pixelSize: 15
                }

                Text {
                    id: minute
                    text: getWithLeadingZero(new Date().getMinutes());
                    color: "#FFFFFF"
                    font.pixelSize: 15

                    Timer {
                        repeat: true
                        interval: 1000
                        running: true
                        onTriggered: minute.text = getWithLeadingZero(new Date().getMinutes());
                    }
                }
                
                Text {
                    text: ":"
                    color: "#FFFFFF"
                    font.pixelSize: 15
                }

                Text {
                    id: seconde
                    text: getWithLeadingZero(new Date().getSeconds());
                    color: "#FFFFFF"
                    font.pixelSize: 15

                    Timer {
                        repeat: true
                        interval: 500
                        running: true
                        onTriggered: seconde.text = getWithLeadingZero(new Date().getSeconds());
                    }
                }
            }
        }
    }
}