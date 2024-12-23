#pragma once

#include <QTableWidget>


class Invoice_table : public QTableWidget
{
	Q_OBJECT

public:

	Invoice_table(int rows, int columns, QWidget* parent = nullptr);
	~Invoice_table();
}