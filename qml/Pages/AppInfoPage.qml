import QtQuick 2.12
import Ubuntu.Components 1.3
import "../Components"

Page {
    id: appInfoPage
    anchors.fill: parent

    header: standardHeader

    PageHeader {
        id: standardHeader
        title: "About"
    }

    ScrollView {
        id: aboutScroll
        width: appInfoPage.width
        height: parent.height
        anchors {
            top: parent.top
            topMargin: parent.header.height
            left: parent.left
        }

        Item {
            width: aboutScroll.width
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: units.gu(2)
            }

            Column {
                id: layout
                width: parent.width

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: units.gu(2)
                }

                Column {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 5
                    height: units.gu(18)

                    UbuntuShape {
                        width: units.gu(16)
                        height: width
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: "medium"

                        source: Image {
                            source: Qt.resolvedUrl("../../assets/logo.png")
                        }
                    }

                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Overloader v" + Qt.application.version
                    }
                }

                SectionDivider {
                    text: "Resources"
                }

                ListItem {
                    onClicked: Qt.openUrlExternally("https://github.com/64ArthurAraujo/")
                    ListItemLayout {
                        anchors.centerIn: parent
                        title.text: i18n.tr("Source code")
                        ProgressionSlot {}
                    }
                }

                ListItem {
                    onClicked: Qt.openUrlExternally("https://github.com/64ArthurAraujo/")
                    ListItemLayout {
                        anchors.centerIn: parent
                        title.text: i18n.tr("Report a issue")
                        ProgressionSlot {}
                    }
                }

            }
        }
    }
}