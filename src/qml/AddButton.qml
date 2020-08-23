import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

import Utils 1.0

Rectangle {
    id: root

    implicitWidth: 15
    implicitHeight: 15
    color: Material.accent
    radius: implicitWidth * 0.5
   
    Text {
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Material.background
        text: "+"
        font {
            family: Fonts.workSans.semiBold.name
            pointSize: 11
        }
        transform: Translate { y: -1 }
    }
}