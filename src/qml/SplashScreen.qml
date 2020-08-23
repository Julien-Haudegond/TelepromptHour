import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property color fontColor: Material.foreground

    FontLoader { id: materialIcons; source: "fonts/MaterialIcons-Regular.ttf" }
    FontLoader { id: workSansSB; source: "fonts/WorkSans-SemiBold.ttf" }

    ColumnLayout {
        anchors.fill: parent

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
                    family: workSansSB.name
                    pointSize: 24
                }
                text: "TelepromptHour"
            }

            Text {
                id: logo
                Layout.alignment: Qt.AlignCenter
                color: fontColor
                font {
                    family: materialIcons.name
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
}