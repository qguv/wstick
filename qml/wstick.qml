import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.11

GridLayout {
  anchors.fill: parent

  ToolBar {
    id: toolbar
    Flow {
      anchors.fill: parent
      ToolButton {
        text: qsTr("Open")
        icon.name: "document-open"
        onClicked: fileOpenDialog.open()
      }
    }
  }

  FileDialog {
    id: fileOpenDialog
    title: "Select an image file"
    folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
    nameFilters: [
      "Image files (*.png *.jpeg *.jpg)",
    ]
    onAccepted: {
      image.source = fileOpenDialog.fileUrl
      toolbar.visible = false
    }
  }

  Image {
    Layout.fillWidth: true
    Layout.fillHeight: true
    id: image
    fillMode: Image.PreserveAspectFit
    asynchronous: true
  }
}
