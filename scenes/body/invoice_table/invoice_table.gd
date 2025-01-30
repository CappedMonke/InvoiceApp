class_name InvoiceTable
extends Control

const INVOICE_TABLE_ROW = preload("res://scenes/body/invoice_table/invoice_table_row.tscn")

@onready var rows: VBoxContainer = $table/rows

func _ready() -> void:
	PersistantData.new_invoice_to_display.connect(_fill_table)
	_create_new_table()

func _clear_table() -> void:
	for child in rows.get_children():
		child.queue_free()

func _fill_table(invoice: Invoice) -> void:
	_clear_table()
	for row_data in invoice.table:
		var table_row := INVOICE_TABLE_ROW.instantiate()
		table_row.populate(row_data)
		rows.add_child(table_row)

func _create_new_table() -> void:
	_clear_table()
	var empty_row := INVOICE_TABLE_ROW.instantiate()
	empty_row.is_deletable = false
	rows.add_child(empty_row)
