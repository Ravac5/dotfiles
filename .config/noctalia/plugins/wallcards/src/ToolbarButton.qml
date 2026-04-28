import QtQuick
import qs.Commons
import qs.Widgets

Rectangle {
  id: root

  property string icon: ""
  property string label: ""
  property string hotkey: ""
  property bool active: false
  property color accentColor: active ? Color.mOnSurface : Color.mOnSurfaceVariant
  property bool hasCustomContent: customLoader.sourceComponent !== null

  default property alias customContent: customLoader.sourceComponent

  signal clicked

  width: contentRow.width + Style.margin2M
  height: Style.margin2L
  radius: Style.radiusM
  color: active ? Qt.alpha(accentColor, 0.15) : Qt.alpha(Color.mOnSurface, 0.06)
  border.width: Style.borderS
  border.color: active ? Qt.alpha(accentColor, Style.opacityMedium) : Qt.alpha(Color.mOutline, 0.3)

  Row {
    id: contentRow

    anchors.centerIn: parent
    spacing: Style.marginXS

    NIcon {
      visible: !root.hasCustomContent && root.icon !== ""
      anchors.verticalCenter: parent.verticalCenter
      icon: root.icon
      color: root.accentColor
      font.pointSize: Style.fontSizeS
    }

    NText {
      visible: !root.hasCustomContent && root.label !== ""
      anchors.verticalCenter: parent.verticalCenter
      text: root.label
      color: root.accentColor
      font.pointSize: Style.fontSizeS
    }

    Loader {
      id: customLoader

      anchors.verticalCenter: parent.verticalCenter
      sourceComponent: null
    }

    Rectangle {
      visible: root.hotkey !== ""
      width: Style.marginL
      height: Style.marginL
      radius: Style.radiusM
      anchors.verticalCenter: parent.verticalCenter
      color: Qt.alpha(root.accentColor, root.active ? 0.2 : 0.06)

      NText {
        anchors.centerIn: parent
        text: root.hotkey
        color: Qt.alpha(root.accentColor, root.active ? Style.opacityFull : Style.opacityHeavy)
        font.pointSize: Style.fontSizeXXS
        font.bold: true
      }
    }
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: root.clicked()
  }

  Behavior on color {
    ColorAnimation {
      duration: Style.animationFast
    }
  }

  Behavior on border.color {
    ColorAnimation {
      duration: Style.animationFast
    }
  }
}
