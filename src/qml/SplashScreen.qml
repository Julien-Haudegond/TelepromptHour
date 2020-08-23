import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

import Utils 1.0

ColumnLayout {
    id: root
    anchors.fill: parent

    property color fontColor: Material.foreground
    
    ColumnLayout {
        id: titleLogo
        Layout.alignment: Qt.AlignCenter
        Layout.preferredHeight: title.implicitHeight + logo.implicitHeight
        opacity: 0
        spacing: 5
        transform: Translate { id: titleLogoTranslate; }

        Text {
            id: title
            Layout.alignment: Qt.AlignCenter
            color: fontColor
            font {
                family: Fonts.workSans.semiBold.name
                pointSize: 24
            }
            text: "TelepromptHour"
        }

        Text {
            id: logo
            Layout.alignment: Qt.AlignCenter
            color: fontColor
            font {
                family: Fonts.materialIcons.name
                pointSize: 24
            }
            text: "\ue02c" // 'movie' icon
        }

        Component.onCompleted: {
            fadeIn.running = true
            moveIn.running = true
        }
    }

    PropertyAnimation {
        id: fadeIn
        target: titleLogo
        property: "opacity"
        from: 0
        to: 1
        duration: 1000
    }

    PropertyAnimation {
        id: moveIn
        target: titleLogoTranslate
        property: "y"
        from: 25
        to: 0
        duration: 1000
        easing.type: Easing.OutQuad
    }
}
