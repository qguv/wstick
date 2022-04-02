import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.11

GridLayout {
  anchors.fill: parent

  ToolButton {
    id: button
    Layout.alignment: Qt.AlignCenter
    Layout.fillWidth: true
    Layout.fillHeight: true
    text: qsTr("Open")
    icon.name: "document-open"
    onClicked: fileOpenDialog.open()
  }

  FileDialog {
    id: fileOpenDialog
    title: "Select an image file"
    nameFilters: [
      "Image files (*.png *.jpeg *.jpg)",
    ]
    onAccepted: {
      image.source = fileOpenDialog.fileUrl
      button.visible = false
      image.visible = true
    }
  }

  Image {
    id: image
    visible: false
    Layout.fillWidth: true
    Layout.fillHeight: true
    fillMode: Image.PreserveAspectFit
    asynchronous: true
  }
}
