import QtQuick 2.0
import QtQuick.Controls 1.0

ApplicationWindow
{
    visible: true
    width: 640
    height: 480
    title: qsTr("Minimal Qml")

    Rectangle {
      id: rect
      width: 100
      height: 100

      color: "red"
    }
}

