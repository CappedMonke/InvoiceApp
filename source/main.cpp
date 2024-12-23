#include <QApplication>
#include <QMainWindow>

#include "main_window.hpp"


int main(int argc, char* argv[])
{
	QApplication app(argc, argv);

	Main_window main_window;
	main_window.show();

	return app.exec();
}
