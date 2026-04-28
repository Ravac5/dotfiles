import QtQuick
import QtQuick.Layouts
import qs.Commons
import qs.Widgets

ColumnLayout {
  id: root
  property var pluginApi: null

  property var cfg: pluginApi?.pluginSettings || ({})
  property var defaults: pluginApi?.manifest?.metadata?.defaultSettings || ({})

  property bool editShowImageType: cfg.show_image_type ?? defaults.show_image_type ?? true
  property bool editShowImageName: cfg.show_image_name ?? defaults.show_image_name ?? true
  property bool editShowTopBar: cfg.show_top_bar ?? defaults.show_top_bar ?? true

  spacing: Style.marginL

  NToggle {
    label: pluginApi?.tr("settings.show_image_type.label")
    description: pluginApi?.tr("settings.show_image_type.desc")
    checked: root.editShowImageType
    onToggled: checked => root.editShowImageType = checked
    defaultValue: root.defaults.show_image_type ?? true
  }

  NToggle {
    label: pluginApi?.tr("settings.show_image_name.label")
    description: pluginApi?.tr("settings.show_image_name.desc")
    checked: root.editShowImageName
    onToggled: checked => root.editShowImageName = checked
    defaultValue: root.defaults.show_image_name ?? true
  }

  NToggle {
    label: pluginApi?.tr("settings.show_top_bar.label")
    description: pluginApi?.tr("settings.show_top_bar.desc")
    checked: root.editShowTopBar
    onToggled: checked => root.editShowTopBar = checked
    defaultValue: root.defaults.show_top_bar ?? true
  }

  // Required — called by the shell when user saves
  function saveSettings() {
    if (!pluginApi) return;
    pluginApi.pluginSettings.show_image_type = root.editShowImageType;
    pluginApi.pluginSettings.show_image_name = root.editShowImageName;
    pluginApi.pluginSettings.show_top_bar = root.editShowTopBar;
    pluginApi.saveSettings();
  }
}
