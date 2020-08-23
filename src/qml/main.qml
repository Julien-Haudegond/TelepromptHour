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
}
