#include "toast.h"
#include <QtAndroidExtras>
#include <jni.h>
Toast::Toast(QObject *parent):
    QObject(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);
}

void Toast::makeText(const QByteArray& toastText, Toast::TimePeriod period)
{
    QtAndroid::runOnAndroidThread([&]{
        QAndroidJniObject javastr = QAndroidJniObject::fromString(toastText);
               QAndroidJniObject toast = QAndroidJniObject::callStaticObjectMethod(TOAST_PACKAGE, MAKE_TEXT_METHOD_NAME,
                                                                                   TOAST_MAKE_TEXT_SIGNATURE,
                                                                                   QtAndroid::androidActivity().object(), javastr.object(), jint(period));
               toast.callMethod<void>(SHOW_METHOD_NAME);
    });

}

Toast::~Toast()
{
}
