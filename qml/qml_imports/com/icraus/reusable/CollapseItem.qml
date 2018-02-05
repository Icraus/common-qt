import QtQuick 2.0
import QtQuick.Controls 2.2

Row{
    id: root
    signal collapse()
//    signal valueChanged()
    property alias toolTipText: button.toolTipText
    property alias text: button.text
    property alias control: control
    signal valueChanged()
    Connections{
        target: content
        onValueChanged: valueChanged()

    }

    property Item contentItem: Slider{
        id: content
        value: 0.5

    }

    Connections{
        target: root
        onCollapse: button.clicked()
    }
    Component.onCompleted: {
        collapse()
    }
    spacing: 5
    ToolButtonTip{
        id: button
        text: ""
        hoverEnabled: true
        onClicked: {
            if(control.width > 0){
                control.width = 0;
            }else{
                control.width = control.implicitWidth;
            }
        }
    }

    Control{
        id: control
        onHoveredChanged:  {
            if(!control.hovered)
                collapse()
        }
        hoverEnabled: true
        contentItem: root.contentItem

        Behavior on width {
            ParallelAnimation{
                NumberAnimation{
                    duration: 800
                    target: control
                    property: "width"
                }
                ScriptAction{
                    script: control.opacity = !control.opacity;
                }
            }
        }

        Behavior on opacity{
            NumberAnimation{
                duration: 800
                target: control
                property: "opacity"
            }
        }

    }
}

