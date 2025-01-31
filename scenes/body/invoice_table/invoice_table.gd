class_name InvoiceTable
extends Control

const INVOICE_TABLE_ROW = preload("res://scenes/body/invoice_table/invoice_table_row.tscn")

@onready var scrollbox: ScrollContainer = $table/scrollbox
@onready var rows: VBoxContainer = $table/scrollbox/rows

var current_invoice: Invoice = null

func initialize(invoice: Invoice) -> void:
	current_invoice = invoice
	if current_invoice.table.is_empty():
		_create_new_table()
	else:
		_fill_table(current_invoice)

func _clear_table() -> void:
	for child in rows.get_children():
		child.queue_free()

func _fill_table(invoice: Invoice) -> void:
	_clear_table()
	current_invoice = invoice
	for row_data in invoice.table:
		_create_new_row().populate(row_data)

func _create_new_table() -> void:
	_clear_table()
	_create_new_row()

func _create_new_row() -> InvoiceTableRow:
	var row := INVOICE_TABLE_ROW.instantiate()
	if rows.get_child_count() == 0:
		row.is_deletable = false
	else:
		(rows.get_children().back() as InvoiceTableRow).create_new_row.disconnect(_create_new_row)
	rows.add_child(row)
	row.create_new_row.connect(_create_new_row)
	row.pre_row_deletion.connect(_on_pre_row_deletion)
	row.request_save_invoice.connect(save_current_invoice)
	return row

func _on_pre_row_deletion(row: InvoiceTableRow) -> void:
	if row == rows.get_children().back():
		var new_last_row := rows.get_children()[rows.get_child_count() - 2] as InvoiceTableRow
		new_last_row.create_new_row.connect(_create_new_row)

func save_current_invoice() -> void:
	current_invoice.table.clear()
	for row in rows.get_children():
		var data := (row as InvoiceTableRow).data
		current_invoice.table.push_back(data)
	PersistentData.save_invoice(current_invoice, PersistentData.unfinished_invoices_absolute_directory)
