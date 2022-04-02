import QtQuick 2.3
import QtQuick.Controls 2.12
import Qt.labs.platform 1.1

Item {
  Rectangle {
    color: "red"
    height: 100
    width: 100
    opacity: 0.5

    Rectangle {
      color: "blue"
      height: 100
      width: 100
      x: 50
      y: 50
    }
  }

  ToolBar {
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
    }
  }

  Image {
    id: image
    anchors.fill: parent
    fillMode: Image.PreserveAspectFit
    asynchronous: true
  }
}
