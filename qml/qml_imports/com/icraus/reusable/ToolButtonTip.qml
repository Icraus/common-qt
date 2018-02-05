import QtQuick 2.4
import QtQuick.Controls 2.2
ToolButton {
    property alias toolTip: toolTip
    property alias toolTipText: toolTip.text


    hoverEnabled: true
    ToolTip{
        id: toolTip
        delay: 1000
        timeout: 3000
        visible: parent.hovered && text.length > 0
    }
}
