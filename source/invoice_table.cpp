#include "invoice_table.hpp"


Invoice_table::Invoice_table(int rows, int columns, QWidget* parent)
    : QTableWidget(rows, columns, parent)
{
	setHorizontalHeaderLabels({"Datum", "Artikel/Leistung", "Preis €"});
	setEditTriggers(QAbstractItemView::DoubleClicked);
	setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
}

Invoice_table::Invoice_table()
{
}
