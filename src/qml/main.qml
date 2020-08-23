import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQml 2.15

ApplicationWindow {
    visible: true
    width: 360
    height: 520
    title: qsTr("TelepromptHour")

    Material.theme: Material.Dark
    Material.accent: Material.color(Material.Teal, Material.Shade400)
    Material.primary: Material.color(Material.Teal, Material.Shade400)
    Material.foreground: Material.color(Material.Grey, Material.Shade300)
    Material.background: Material.color(Material.Grey, Material.Shade900)

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
