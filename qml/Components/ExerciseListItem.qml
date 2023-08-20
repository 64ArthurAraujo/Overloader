import QtQuick 2.7
import QtQuick.Controls 2.5
import Ubuntu.Components 1.3

ListItem {
    id: exerciseListItem
    height: exerciseListLayout.height + (divider.visible ? divider.height : 0)

    property var exerciseModelData;
    property var completed: false;

    onClicked: {
        print(exerciseListItem.completed);
    }

    ExerciseListItemLayout {
        id: exerciseListLayout
        exerciseModel: exerciseModelData
    }

    leadingActions: ListItemActions {
        actions: [
            Action {
                iconName: "edit"
            },
            Action {
                iconName: "delete"
                onTriggered: {
                    exerciseListModel.remove(index);
                }
            }
        ]
    }

    trailingActions: ListItemActions {
        actions: [
            Action {
                iconName: "select"
                onTriggered: {
                    exerciseListItem.completed = true;
                }
            }
        ]
    }
}