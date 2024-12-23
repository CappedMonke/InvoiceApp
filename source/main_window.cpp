#include "main_window.hpp"

#include <QLabel>
#include <QMenuBar>
#include <QStatusBar>
#include <QTableWidget>
#include <QVBoxLayout>

#include <invoice_table.hpp>


Main_window::Main_window(QWidget* parent)
    : QMainWindow(parent)
{
	showMaximized();
	setup_ui();
}

Main_window::~Main_window()
{
}

void Main_window::setup_ui()
{
	setWindowTitle("Rechnungen");

	QMenuBar* menu_bar = new QMenuBar(this);
	setMenuBar(menu_bar);

	QMenu* file_menu = menu_bar->addMenu("File");
	file_menu->addAction("Exit", this, &Main_window::close);

	QWidget* central_widget = new QWidget(this);
	setCentralWidget(central_widget);

	Invoice_table* invoice_table = new Invoice_table(5, 3, this);

	QVBoxLayout* layout = new QVBoxLayout(central_widget);
	layout->addWidget(invoice_table, 0, Qt::AlignHCenter);
}
