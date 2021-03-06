#include "MessageHandler.hpp"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QtGlobal>
#include <QQuickStyle>

#include <iostream>

int main(int argc, char* argv[]) {
    // Application
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Material");
    
    // Logging messages
    #ifdef QT_DEBUG
        qInstallMessageHandler(MessageHandler::handler);
    #endif

    // QML Engine
    QQmlApplicationEngine engine;
    #ifdef INSTANT_RELOAD
        engine.addImportPath(QStringLiteral("src/qml")); // For QML Plugins
        const QUrl url(QStringLiteral("src/qml/App.qml")); // Avoid use of RCC during development on Desktop
    #else
        engine.addImportPath(QStringLiteral("qrc:///src/qml")); // For QML Plugins
        const QUrl url(QStringLiteral("qrc:///src/qml/App.qml"));
    #endif
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
