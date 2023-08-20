import QtQuick 2.12
import Ubuntu.Components 1.3
import "../Components"

Page {
    id: newExercisePage
    anchors.fill: parent

    header: standardHeader

    PageHeader {
        id: standardHeader
        title: "New Exercise"

        trailingActionBar.actions: [
            Action {
                iconName: "ok"
                text: "Save"
                onTriggered: print("Saved new Exercise")
            }
        ]
    }
}