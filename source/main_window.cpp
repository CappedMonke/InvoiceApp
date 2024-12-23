#include "main_window.hpp"

#include <QLabel>
#include <QListWidget>
#include <QMenuBar>
#include <QPushButton>
#include <QStatusBar>
#include <QTableWidget>
#include <QVBoxLayout>


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

	QWidget*     left_widget = new QWidget(this);
	QVBoxLayout* left_layout = new QVBoxLayout(left_widget);
	left_layout->setAlignment(Qt::AlignTop);

	QPushButton* button1 = new QPushButton("Button 1", this);
	QPushButton* button2 = new QPushButton("Button 2", this);
	QPushButton* button3 = new QPushButton("Button 3", this);

	left_layout->addWidget(button1);
	left_layout->addWidget(button2);
	left_layout->addWidget(button3);

	QTableWidget* invoice_table = new QTableWidget(5, 3, this);
	invoice_table->setHorizontalHeaderLabels(
	    {"Datum", "Artikel/Leistung", "Preis €"});
	invoice_table->setEditTriggers(QAbstractItemView::DoubleClicked);
	invoice_table->setSizePolicy(QSizePolicy::Expanding,
	                             QSizePolicy::Expanding);

	QHBoxLayout* main_layout = new QHBoxLayout(central_widget);
	main_layout->addWidget(left_widget);
	main_layout->addWidget(invoice_table);
}
