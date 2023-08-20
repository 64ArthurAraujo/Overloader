import QtQuick 2.7
import QtQuick.Controls 2.5
import Ubuntu.Components 1.3

ListItemLayout {
    id: exerciseListLayout

    property var exerciseModel;

    title.text: exerciseModel.exercise_name
    title.color: exerciseListItem.completed ? UbuntuColors.lightGreen : UbuntuColors.lightAubergine
    subtitle.text: exerciseModel.reps

    Item {
        id: slot
        width: label2.width
        height: parent.height
                                           
        SlotsLayout.overrideVerticalPositioning: true

        Label {
            id: lab
            anchors.right: label2.right
            text: exerciseModel.weight + exerciseModel.weight_metric
            fontSize: "small"
            y: exerciseListLayout.mainSlot.y + exerciseListLayout.title.y
            + exerciseListLayout.title.baselineOffset - baselineOffset
        }

        Label {
            id: label2
            text: exerciseModel.mode
            fontSize: "small"
            y: exerciseListLayout.mainSlot.y + exerciseListLayout.subtitle.y
            + exerciseListLayout.subtitle.baselineOffset - baselineOffset
        }
    }
}