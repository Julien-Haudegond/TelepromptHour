import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQml 2.15

import Utils 1.0

ApplicationWindow {
    visible: true
    width: 360
    height: 520
    title: qsTr("TelepromptHour")

    Material.theme: Material.Dark
    Material.accent: Colors.middleTeal
    Material.primary: Colors.middleTeal
    Material.foreground: Colors.lightestGrey
    Material.background: Colors.darkestGrey

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: splashScreen

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 500
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 500
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 500
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 500
            }
        }
    }

    Component {
        id: splashScreen

        SplashScreen {}
    }

    Timer {
        interval: 3000; running: true; repeat: false
        onTriggered: stack.push(startPage)
    }

    Component {
        id: startPage

        StartPage {}
    }
}
