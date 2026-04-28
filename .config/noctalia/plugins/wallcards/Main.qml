import QtQuick
import Quickshell.Io

Item {
  id: root
  property var pluginApi: null

  Loader {
    id: windowLoader
    active: false
    sourceComponent: WallcardsWindow {
      pluginApi: root.pluginApi
    }
  }

  IpcHandler {
    target: "plugin:wallcards"

    function toggle() {
      root.toggle();
    }

    function show() {
      root.show();
    }

    function hide() {
      root.hide();
    }
  }

  function toggle() {
    windowLoader.active = !windowLoader.active
  }

  function show() {
    windowLoader.active = true;
  }

  function hide() {
    windowLoader.active = false
  }
}
