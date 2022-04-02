#include <QApplication>
#include <QQuickView>
#include <QMainWindow>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QMainWindow window;

    QQuickView* v = new QQuickView;
    window.setCentralWidget(v);

    v->setSource(QUrl::fromLocalFile(("draw_rectangles.qml")));

    window.setStyleSheet("background:transparent;");
    window.setAttribute(Qt::WA_TranslucentBackground);
    window.setWindowFlags(Qt::FramelessWindowHint);
    window.show();

    return app.exec();
}
