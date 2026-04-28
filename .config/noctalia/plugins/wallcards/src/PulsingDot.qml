import QtQuick
import qs.Commons

Rectangle {
  id: root

  property bool pulsing: false
  property color dotColor: Color.mTertiary

  anchors.verticalCenter: parent.verticalCenter
  width: Style.marginS
  height: Style.marginS
  radius: Style.marginXXXS
  color: pulsing ? dotColor : Qt.alpha(Color.mOnSurfaceVariant, Style.opacityLight)

  SequentialAnimation on opacity {
    running: root.pulsing
    loops: Animation.Infinite

    NumberAnimation {
      to: Style.opacityLight
      duration: Style.animationSlowest
      easing.type: Easing.InOutSine
    }

    NumberAnimation {
      to: Style.opacityFull
      duration: Style.animationSlowest
      easing.type: Easing.InOutSine
    }
  }
}
