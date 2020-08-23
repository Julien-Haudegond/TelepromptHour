import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

import Utils 1.0

ColumnLayout {
    id: root
    anchors.fill: parent

    property color fontColor: Colors.lightGrey

    Text {
        id: title
        Layout.alignment: Qt.AlignHCenter
        color: Material.foreground
        font {
            family: Fonts.workSans.semiBold.name
            pointSize: 16
        }
        text: "TelepromptHour"
    }

    ColumnLayout {
        id: textToReadContainer

        Layout.fillWidth: true
        Layout.leftMargin: 20
        Layout.rightMargin: 20
        
        RowLayout {
            Text {
                id: textToRead
                color: fontColor
                font {
                    family: Fonts.workSans.semiBold.name
                    pointSize: 11
                }
                text: "Text to Read"
            }
            
            AddButton {}
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            color: "transparent"
            border {
                color: Colors.darkGrey
                width: 2
            }
            radius: 6

            Flickable {
                anchors.fill: parent
                clip: true

                TextArea.flickable: TextArea {
                    id: textArea
                    wrapMode: Text.WordWrap
                    topPadding: 4
                    bottomPadding: 6
                    leftPadding: 5
                    rightPadding: 5
                    color: Colors.lightestTeal

                    background: Rectangle { color: "transparent" } // Just to override default style

                    placeholderText: "Enter the script..."
                }
            }
        }
    }

    ColumnLayout {
        id: settingsContainer

        Layout.fillWidth: true
        Layout.leftMargin: 20
        Layout.rightMargin: 20
    }
}