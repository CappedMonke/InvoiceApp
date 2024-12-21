#include <QApplication>
#include <QMainWindow>
#include <QPalette>
#include <QStyleFactory>
#include <QStyle>
#include <QMenuBar>
#include <QMenu>
#include <QAction>
#include <QMessageBox>

void onSave() {
    QMessageBox::information(nullptr, "Save", "Save action triggered!");
}

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    QMainWindow mainWindow;

    QPalette darkPalette;
    darkPalette.setColor(QPalette::Window, QColor(53, 53, 53));
    app.setPalette(darkPalette);

    QMenuBar *menuBar = mainWindow.menuBar();
    QMenu *fileMenu = menuBar->addMenu("File");
    QAction *saveAction = new QAction("Save", &mainWindow);
    fileMenu->addAction(saveAction);
    QMenu *editMenu = menuBar->addMenu("Edit");

    QObject::connect(saveAction, &QAction::triggered, &onSave);

    mainWindow.showMaximized();
    return app.exec();
}
