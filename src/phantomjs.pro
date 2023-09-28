TEMPLATE = app
TARGET = phantomjs
QT += network webkit
CONFIG += console

DESTDIR = ../bin

RESOURCES = phantomjs.qrc \
    ghostdriver/ghostdriver.qrc \
    qt/src/3rdparty/webkit/Source/WebCore/inspector/front-end/WebKit.qrc \
    qt/src/3rdparty/webkit/Source/WebCore/generated/InspectorBackendStub.qrc

HEADERS += csconverter.h \
    phantom.h \
    callback.h \
    webpage.h \
    webserver.h \
    consts.h \
    utils.h \
    networkaccessmanager.h \
    cookiejar.h \
    filesystem.h \
    system.h \
    env.h \
    terminal.h \
    encoding.h \
    config.h \
    childprocess.h \
    repl.h

SOURCES += phantom.cpp \
    callback.cpp \
    webpage.cpp \
    webserver.cpp \
    main.cpp \
    csconverter.cpp \
    utils.cpp \
    networkaccessmanager.cpp \
    cookiejar.cpp \
    filesystem.cpp \
    system.cpp \
    env.cpp \
    terminal.cpp \
    encoding.cpp \
    config.cpp \
    childprocess.cpp \
    repl.cpp

OTHER_FILES += \
    bootstrap.js \
    configurator.js \
    modules/fs.js \
    modules/webpage.js \
    modules/webserver.js \
    modules/child_process.js \
    repl.js

include(gif/gif.pri)
include(mongoose/mongoose.pri)
include(linenoise/linenoise.pri)
include(qcommandline/qcommandline.pri)

linux*|mac {
    QTPLUGIN += \
        qcncodecs \
        qjpcodecs \
        qkrcodecs \
        qtwcodecs
}


win32: RC_FILE = phantomjs_win.rc
os2:   RC_FILE = phantomjs_os2.rc

mac {
    QMAKE_CXXFLAGS += -fvisibility=hidden
    QMAKE_LFLAGS += '-sectcreate __TEXT __info_plist Info.plist'
    CONFIG -= app_bundle
# Uncomment to build a Mac OS X Universal Binary (i.e. x86 + ppc)
#    CONFIG += x86 ppc
}

win32-msvc* {
    LIBS += -lCrypt32
    CONFIG(static) {
        DEFINES += STATIC_BUILD
        QTPLUGIN += \
            qcncodecs \
            qjpcodecs \
            qkrcodecs \
            qtwcodecs \
            qico
    }
}
