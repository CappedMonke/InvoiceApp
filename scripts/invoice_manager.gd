extends Node


const INVOICES_EXPORT_PATH := "Rechnungen/Export"
const INVOICES_RAW_PATH := "Rechnungen/Rohdaten"


var table: Table = null
var latest_invoice_id = 0


func _ready() -> void:
	if not DirAccess.open(INVOICES_EXPORT_PATH):
		DirAccess.make_dir_recursive_absolute(INVOICES_EXPORT_PATH)
	if not DirAccess.open(INVOICES_RAW_PATH):
		DirAccess.make_dir_recursive_absolute(INVOICES_RAW_PATH)


func save_table() -> void:
	if table == null:
		print("Table cannot be null")
	var table_data = table.get_data()
	var file = FileAccess.open(INVOICES_RAW_PATH + "/" + str(latest_invoice_id) + ".json", FileAccess.WRITE)
	file.store_string(table_data)


func load_table(invoice_id: int) -> void:
	var table_data: Array
	var file = FileAccess.open(INVOICES_RAW_PATH + "/" + str(invoice_id) + ".json", FileAccess.READ)
	table_data = JSON.parse_string(file.get_as_text())
	table.create_table_and_populate(table_data)
