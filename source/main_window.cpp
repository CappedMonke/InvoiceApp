#include "main_window.hpp"

#include <QMenuBar>
#include <QStatusBar>
#include <QLabel>


Main_window::Main_window(QWidget *parent)
    : QMainWindow(parent)
{
    setup_ui();
}

Main_window::~Main_window() 
{
}

void Main_window::setup_ui() 
{
    setWindowTitle("Rechnungs App");

    QMenuBar *menu_bar = new QMenuBar(this);
    setMenuBar(menu_bar);

    QMenu *file_menu = menu_bar->addMenu("File");
    file_menu->addAction("Exit", this, &Main_window::close);

    QStatusBar *status_bar = new QStatusBar(this);
    setStatusBar(status_bar);

    QLabel *status_label = new QLabel("Ready", this);
    status_bar->addWidget(status_label);
}
