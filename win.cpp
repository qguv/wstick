#include <QApplication>
#include <QDeclarativeView>
#include <QMainWindow>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QMainWindow window;

    QDeclarativeView* v = new QDeclarativeView;
    window.setCentralWidget(v);

    v->setSource(QUrl::fromLocalFile(("draw_rectangles.qml")));   

    window.setStyleSheet("background:transparent;");
    window.setAttribute(Qt::WA_TranslucentBackground);
    window.setWindowFlags(Qt::FramelessWindowHint);
    window.show();

    return app.exec();
}
