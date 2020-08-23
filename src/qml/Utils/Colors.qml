pragma Singleton
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

QtObject {
    readonly property color lightestGrey: Material.color(Material.Grey, Material.Shade300)
    readonly property color lightGrey: Material.color(Material.Grey, Material.Shade500)
    readonly property color darkGrey: Material.color(Material.Grey, Material.Shade800)
    readonly property color darkestGrey: Material.color(Material.Grey, Material.Shade900)

    readonly property color lightestTeal: Material.color(Material.Teal, Material.Shade100)
    readonly property color middleTeal: Material.color(Material.Teal, Material.Shade400)
}