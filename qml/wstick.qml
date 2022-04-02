import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.11

Item {
  id: root
  anchors.fill: parent

  Component.onCompleted: {
    if (Qt.application.arguments[1]) {
      image.source = Qt.resolvedUrl("file:" + Qt.application.arguments[1])
    }
  }

  GridLayout {
    anchors.fill: parent

    Button {
      id: button
      Layout.alignment: Qt.AlignCenter
      Layout.fillWidth: true
      Layout.fillHeight: true
      text: qsTr("Open")
      icon.name: "document-open"
      onClicked: dialog.open()
    }

    Image {
      id: image
      visible: false
      Layout.fillWidth: true
      Layout.fillHeight: true
      fillMode: Image.PreserveAspectFit
      asynchronous: true

      onStatusChanged: {
        var ready = image.status == Image.Ready
        image.visible = ready
        button.visible = !ready
      }

    }
  }

  FileDialog {
    id: dialog
    title: "Select an image file"
    nameFilters: [
      "Image files (*.png *.jpeg *.jpg)",
    ]
    onAccepted: image.source = dialog.fileUrl
  }

  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.RightButton
    onClicked: {
      image.source = ""
    }
  }
}
