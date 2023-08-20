import QtQuick 2.12
import Ubuntu.Components 1.3
import "./Components"
import "./Pages"

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'overloader.arthuraraujo'
    automaticOrientation: true

    width: units.gu(80)
    height: units.gu(70)

    PageStack { 
        id: pStack 

        Component.onCompleted: push(mainPage)
    }

    MainPage { 
        id: mainPage
        pageStack: pStack 
    }
}
