#include <QApplication>
#include <QQuickView>
#include <QMainWindow>
#include <QSurface>
#include <QSurfaceFormat>
#include <QColor>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QMainWindow window;

    QQuickView v;
    v.setSurfaceType(QSurface::OpenGLSurface);

    QSurfaceFormat fmt;
    fmt.setAlphaBufferSize(8);
    fmt.setRenderableType(QSurfaceFormat::OpenGL);

    v.setFormat(fmt);
    v.setColor(QColor(Qt::transparent));
    v.setClearBeforeRendering(true);

    v.setFlags(Qt::FramelessWindowHint);

    v.setSource(QUrl::fromLocalFile(("draw_rectangles.qml")));

    v.show();

    return app.exec();
}
