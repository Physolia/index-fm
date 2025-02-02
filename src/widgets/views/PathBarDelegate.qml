import QtQuick 2.14
import QtQuick.Controls 2.14

import org.mauikit.controls 1.3 as Maui
import org.maui.index 1.0 as Index

import QtQuick.Templates 2.15 as T

T.Control
{
    id: control

    Maui.Theme.colorSet: Maui.Theme.Button
    Maui.Theme.inherit: false

    implicitWidth: _label.implicitWidth + rightPadding + leftPadding
    implicitHeight: _label.implicitHeight + topPadding + bottomPadding

    padding: Maui.Style.defaultPadding
    rightPadding: Maui.Style.space.big
    leftPadding: rightPadding

    property bool checked :  ListView.isCurrentItem
    property bool lastOne : false
    property bool firstOne : false

    ToolTip.delay: 1000
    ToolTip.timeout: 5000
    ToolTip.visible: _mouseArea.containsMouse || _mouseArea.containsPress
    ToolTip.text: model.path


    /**
      *
      */
    signal rightClicked()

    /**
      *
      */
    signal clicked()

    /**
      *
      */
    signal doubleClicked()

    /**
      *
      */
    signal pressAndHold()

    background: Index.PathArrowBackground
    {
      id: _arrowBG
        color: control.checked ? Maui.Theme.highlightColor : (control.hovered ? Maui.Theme.hoverColor : (control.firstOne? "transparent": Maui.Theme.backgroundColor))

       arrowWidth: 8
    }

    contentItem: MouseArea
    {
        id: _mouseArea
        propagateComposedEvents: true
        preventStealing: false
        hoverEnabled: !Maui.Handy.isMobile
        acceptedButtons:  Qt.RightButton | Qt.LeftButton
        onClicked:
        {
            if(!Maui.Handy.isMobile && mouse.button === Qt.RightButton)
                control.rightClicked()
            else
                control.clicked()
        }

        onDoubleClicked: control.doubleClicked()
        onPressAndHold : control.pressAndHold()

        containmentMask:_arrowBG

        Label
        {
            id: _label
            text: model.label
            anchors.fill: parent

            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment:  Qt.AlignVCenter

            elide: Qt.ElideRight
            wrapMode: Text.NoWrap
            opacity: control.checked ? 1 : 0.6

            font.weight: control.checked ? Font.DemiBold : Font.Normal
            color: control.checked ? Maui.Theme.highlightedTextColor : Maui.Theme.textColor
        }
    }
}
