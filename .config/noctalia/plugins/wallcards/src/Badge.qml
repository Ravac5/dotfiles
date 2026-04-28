import QtQuick
import qs.Commons
import qs.Widgets

Rectangle {
  id: root

  property string text: ""
  property string icon: ""
  property bool boldText: false
  property color textColor: Color.mOnSurface
  property color iconColor: Color.mPrimary
  property color backgroundColor: Color.mSurface
  property real fontSize: Style.fontSizeXS

  width: badgeRow.implicitWidth + Style.margin2S
  height: badgeRow.implicitHeight + Style.margin2XS
  color: root.backgroundColor
  radius: Style.radiusM
  z: 10

  Row {
    id: badgeRow

    anchors.centerIn: parent
    spacing: Style.marginS

    NIcon {
      visible: root.icon
      anchors.verticalCenter: parent.verticalCenter
      icon: root.icon
      color: root.iconColor
      font.pointSize: root.fontSize
    }

    NText {
      anchors.verticalCenter: parent.verticalCenter
      text: root.text
      color: root.textColor
      font.pointSize: root.fontSize
      font.bold: root.boldText
      font.letterSpacing: 0.5
    }
  }
}
