TEMPLATE = lib
TARGET = AndroidExtensions
QT += qml quick androidextras
CONFIG += plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.icraus.android

# Input
SOURCES += \
    androidextensions_plugin.cpp \
    toast.cpp

HEADERS += \
    androidextensions_plugin.h \
    toast.h

DISTFILES = qmldir
DESTDIR = "../lib"
#!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
#    copy_qmldir.target = $$OUT_PWD/qmldir
#    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
#    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
#    QMAKE_EXTRA_TARGETS += copy_qmldir
#    PRE_TARGETDEPS += $$copy_qmldir.target
#}
!android{
    error($$TARGET requiers android kit)
}
