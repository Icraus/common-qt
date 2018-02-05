#include "androidextensions_plugin.h"
#include "toast.h"

#include <QJSEngine>
#include <qqml.h>

void AndroidExtensionsPlugin::registerTypes(const char *uri)
{
    // @uri com.icraus.android
    qmlRegisterType<Toast>(uri, 1, 0, "Toast");
//    QJSEngine engine;
//    Toast *toast = new Toast(nullptr);
//    QJSValue val = engine.newQObject(toast);
//    engine.globalObject().setProperty("toaster", val);
}

