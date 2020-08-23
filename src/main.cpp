#include "MessageHandler.hpp"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QtGlobal>

#include <iostream>

int main(int argc, char* argv[]) {
    // Application
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    // Logging messages
    #ifdef QT_DEBUG
        qInstallMessageHandler(MessageHandler::handler);
    #endif

    // QML Engine
    QQmlApplicationEngine engine;
    #ifdef INSTANT_RELOAD
        const QUrl url(QStringLiteral("src/qml/main.qml")); // Avoid use of RCC during development on Desktop
    #else
        const QUrl url(QStringLiteral("qrc:///src/qml/main.qml"));
    #endif
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
