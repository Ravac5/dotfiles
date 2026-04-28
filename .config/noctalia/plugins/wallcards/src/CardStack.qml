import QtQuick
import qs.Commons

Item {
  id: cardStack

  required property int filteredCount
  required property int cardsShown
  required property int contentHeight2
  required property int topBarHeight
  required property int cardStripWidth
  required property int cardSpacing
  required property real shearFactor
  required property bool livePreview

  property int currentIndex: 0
  property int visibleCount: cardsShown
  property int halfVisible: Math.floor(visibleCount / 2)
  property real contentHeight: contentHeight2 / 1.25 - topBarHeight
  property real centerWidth: width / 3
  property real stripWidth: cardStripWidth
  property real stripGap: cardSpacing
  property real centerX: width / 2 - centerWidth / 2
  property real runningIndex: 0
  property real animationIndex: 0

  signal applyRequested(string filePath)
  signal quitRequested
  signal filterChanged(string filter)
  signal livePreviewToggled

  function wrappedIndex(idx) {
    return ((idx % filteredCount) + filteredCount) % filteredCount;
  }

  function slotToX(slot) {
    if (slot >= 0 && slot <= 1)
      return centerX * (1 - slot) + (centerX + centerWidth + stripGap) * slot;
    if (slot >= -1 && slot < 0)
      return centerX * (1 + slot) + (centerX - stripGap - stripWidth) * -slot;

    if (slot > 1) {
      var firstRight = centerX + centerWidth + stripGap;
      return firstRight + (slot - 1) * (stripWidth + stripGap);
    }

    if (slot < -1) {
      var firstLeft = centerX - stripGap - stripWidth;
      return firstLeft + (slot + 1) * (stripWidth + stripGap);
    }

    return 0;
  }

  function slotToWidth(slot) {
    var t = Math.min(Math.abs(slot), 1);
    return centerWidth + (stripWidth - centerWidth) * t;
  }

  function randomJump() {
    var rnd = Math.floor(Math.random() * filteredCount);
    if (rnd === currentIndex)
      rnd = (rnd + 1) % filteredCount;
    navigateTo(rnd);
  }

  function navigateTo(idx) {
    var newIdx = wrappedIndex(idx);
    var diff = 0;
    if (filteredCount > 0) {
      diff = newIdx - currentIndex;
      var half = filteredCount / 2;
      if (diff > half)
        diff -= filteredCount;
      else if (diff < -half)
        diff += filteredCount;
    }

    runningIndex += diff;
    animationIndex = runningIndex;
    currentIndex = newIdx;

    if (livePreview)
      applyRequested(root.getFilePath(currentIndex));
  }

  focus: true

  Keys.onPressed: function (event) {
    if (event.isAutoRepeat) {
      event.accepted = true;
      return;
    }

    if (event.key === Qt.Key_K || event.key === Qt.Key_Right)
      navigateTo(currentIndex + 1);
    else if (event.key === Qt.Key_J || event.key === Qt.Key_Left)
      navigateTo(currentIndex - 1);
    else if (event.key === Qt.Key_H)
      navigateTo(currentIndex - 7);
    else if (event.key === Qt.Key_L)
      navigateTo(currentIndex + 7);
    else if (event.key === Qt.Key_P)
      livePreviewToggled();
    else if (event.key === Qt.Key_A)
      filterChanged("all");
    else if (event.key === Qt.Key_I)
      filterChanged("images");
    else if (event.key === Qt.Key_V)
      filterChanged("videos");
    else if (event.key === Qt.Key_R || event.key === Qt.Key_Up)
      randomJump();
    else if (event.key === Qt.Key_Return || event.key === Qt.Key_Space || event.key === Qt.Key_Down) {
      applyRequested(root.getFilePath(currentIndex));
      quitRequested();
    }
    else if (event.key === Qt.Key_Escape || event.key === Qt.Key_Q)
      quitRequested();

    event.accepted = true;
  }

  Behavior on animationIndex {
    NumberAnimation {
      duration: Style.animationNormal
      easing.type: Easing.OutBack
      easing.overshoot: 1
    }
  }
}
