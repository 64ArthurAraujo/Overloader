import QtQuick 2.7
import QtQuick.Controls 2.5
import Ubuntu.Components 1.3
import "../Components"

Page {
    id: mainPage
    anchors.fill: parent

    title: standardHeader.title
    header: standardHeader

    property var pageStack;
    property var date: new Date();
    property var weekDay: getShortDayOfWeek(date);
    property var repeaterModel: [];

    PageHeader {
        id: standardHeader
        title: ""
        trailingActionBar.actions: [
            Action {
                iconName: "info"
                text: "Info"
                onTriggered: pageStack.push(Qt.resolvedUrl("AppInfoPage.qml"));
            }
        ]

    }

    function getFormattedDate(date)
    {
        var monthNames = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
        ];

        var month = monthNames[date.getMonth()];
        var day = date.getDate();

        return month + " " + day;
    }

    function getShortDayOfWeek(date)
    {
        var dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        return dayNames[date.getDay()];
    }

    function increaseDay()
    {
        date.setDate(date.getDate() + 1);
        updatePage();

        populateRepeaterModel();
    }

    function decreaseDay()
    {
        date.setDate(date.getDate() - 1);
        updatePage();

        populateRepeaterModel();
    }

    function backToToday()
    {
        date = new Date();
        updatePage();

        populateRepeaterModel();
    }

    function updatePage()
    {
        weekDay = getShortDayOfWeek(date);
        standardHeader.title = getFormattedDate(date) + "   " + weekDay;
    }

    function populateRepeaterModel()
    {
        mainPage.repeaterModel = [];

        if (weekDay == "Sun")
        {
            repeaterModel.push({
                "exercise_name": "Bicep Curls",
                "reps": "3x 15 Reps",
                "start_weight": "6",
                "increase_rate": "1",
                "increase_algorithm": "gradual-weight",
                "start_date": "10-09-2025",
                "weight_metric": "KG",
                "weekday": "Mon",
                "mode": "Drop Set"
            })
        } else if (weekDay == "Mon") {
            repeaterModel.push({
                "exercise_name": "Chest Press Machine",
                "reps": "3x 15 Reps",
                "weight": "10",
                "increase_rate": "1",
                "increase_algorithm": "gradual-repetition",
                "start_date": "10-09-2025",
                "weight_metric": "KG",
                "weekday": "Mon",
                "mode": "Normal Sets"
            })
        }

        exerciseRepeater.model = mainPage.repeaterModel
    }

    Component.onCompleted: {
        populateRepeaterModel();
        updatePage();
    }

    SwipeView {
        id: view
        width: mainPage.width
        anchors {
            top: standardHeader.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Item {
            width: parent.width
            height: parent.height

            ScrollView {
                anchors.fill: parent
                width: mainPage.width
                height: applistcolumn.implicitHeight

                Flickable {
                    anchors.fill: parent
                    width: mainPage.width
                    contentHeight: applistcolumn.implicitHeight

                    ViewItems.selectMode: true

                    ColumnWithTimer {
                        id: applistcolumn
                        width: mainPage.width
                        anchors.fill: parent

                        timerInterval: 10;
                        timerAction: setModel;

                        function setModel()
                        {
                            exerciseRepeater.model = mainPage.repeaterModel;
                        }

                        Repeater {
                            id: exerciseRepeater
                            model: mainPage.repeaterModel

                            ExerciseListItem {
                                id: exerciseListItem
                                width: mainPage.width

                                exerciseModelData: modelData
                            }
                        }
                    }
                }
            }
        }
    }

    DefaultBottomEdge {
        id: defaultBottomEdge

        function addNewExercise() {
            pageStack.push(Qt.resolvedUrl("NewExercisePage.qml"))
        }

        increaseDay: mainPage.increaseDay
        decreaseDay: mainPage.decreaseDay
        backToToday: mainPage.backToToday
        addExercise: addNewExercise
    }
}
