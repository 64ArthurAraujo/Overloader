import QtQuick 2.12
import Ubuntu.Components 1.3

RadialBottomEdge {
    id: defaultBottomEdge
    visible: true

    property var increaseDay
    property var decreaseDay
    property var backToToday
    property var addExercise

    actions: [
        RadialAction {
            id: newExercise
            enabled: true
            iconName: "list-add"
            onTriggered: {
                addExercise()
            }
            text: "New Exercise"
        },
        RadialAction {
            id: forward
            enabled: true
            iconName: "go-next"
            onTriggered: {
                increaseDay()
            }
            text: "Tomorrow"
        },
        RadialAction {
            id: today
            enabled: true
            iconName: "calendar-today"
            onTriggered: {
                backToToday()
            }
            text: "Today"
        },
        RadialAction {
            id: back
            enabled: true
            iconName: "go-previous"
            onTriggered: {
                decreaseDay()
            }
            text: "Yesterday"
        }
    ]
}