#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFontDatabase>
#include "models/authcontroller.h"
#include "models/databasemanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    

    
    // Initialiser la base de données
    DatabaseManager dbManager;
    dbManager.setupTable();
    if (dbManager.setupTable()) {
        qDebug() << "Tout est pret : Base connectee et Table creee !";
    }
    
    
    // Enregistrer l'auth controller
    AuthController authController;
    
    QQmlApplicationEngine engine;
    
    // Exposer l'auth controller à QML
    engine.rootContext()->setContextProperty("authService", &authController);
    
    const QUrl url(u"qrc:/course/Files/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    
    engine.load(url);
    
    return app.exec();
}
