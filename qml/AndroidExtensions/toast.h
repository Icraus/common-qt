#ifndef TOAST_H
#define TOAST_H

#include <QObject>
#define TOAST_PACKAGE "android/widget/Toast"
#define MAKE_TEXT_METHOD_NAME "makeText"
#define CONTEXT_PACKAGE "android/content/Context"
#define TOAST_MAKE_TEXT_SIGNATURE "(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;"
#define SHOW_METHOD_NAME "show"
class Toast : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(Toast)

public:
    Toast(QObject *parent = nullptr);
    enum TimePeriod{
        SHORT = 0,
        LONG
    };
    Q_ENUMS(TimePeriod)
    Q_INVOKABLE /*static*/ void makeText(const QByteArray& toastText, TimePeriod period);
    ~Toast();
};

#endif // TOAST_H
