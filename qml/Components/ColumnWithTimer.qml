import QtQuick 2.7
import QtQuick.Controls 2.5
import Ubuntu.Components 1.3

Column {
    id: appListColumn
    ViewItems.selectMode: false

    property var timerInterval;
    property var timerAction;

    Timer {
        running: true
        interval: timerInterval
        onTriggered: {
            timerAction();
        }
    }
}