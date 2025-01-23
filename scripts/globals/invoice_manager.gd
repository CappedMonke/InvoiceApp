extends Node


const INVOICES_EXPORT_PATH := "Rechnungen/Export"
const INVOICES_PENDING_PATH := "Rechnungen/Rohdaten/Laufend"
const INVOICES_COMPLETE_PATH := "Rechnungen/Rohdaten/Fertig"


var table: Table = null
var pending_invoices_list: PendingInvoicesList = null
var info: Info = null
var current_invoice_id := -1
var latest_invoice_id := -1
var current_customer := ""


func _ready() -> void:
	if not DirAccess.open(INVOICES_EXPORT_PATH):
		DirAccess.make_dir_recursive_absolute(INVOICES_EXPORT_PATH)
	if not DirAccess.open(INVOICES_COMPLETE_PATH):
		DirAccess.make_dir_recursive_absolute(INVOICES_COMPLETE_PATH)
	if not DirAccess.open(INVOICES_PENDING_PATH):
		DirAccess.make_dir_recursive_absolute(INVOICES_PENDING_PATH)


func save_table(pending: bool) -> void:
	if table.is_empty():
		return
	if latest_invoice_id == current_invoice_id - 1:
		latest_invoice_id = current_invoice_id
	var table_data = table.get_data()
	var save_path = INVOICES_PENDING_PATH if pending else INVOICES_COMPLETE_PATH
	var file = FileAccess.open(save_path + "/" + str(current_invoice_id) + ".json", FileAccess.WRITE)
	file.store_string(table_data)
	pending_invoices_list.add_invoice(current_invoice_id)
	Logger.log_success("Rechnung gespeichert")


func load_table(invoice_id: int) -> void:
	if invoice_id == current_invoice_id:
		Logger.log_normal("Rechnung bereits offen")
		return
	current_invoice_id = invoice_id
	var table_data: Array
	var file = FileAccess.open(INVOICES_PENDING_PATH + "/" + str(invoice_id) + ".json", FileAccess.READ)
	table_data = JSON.parse_string(file.get_as_text())
	table.create_table_and_populate(table_data)


func create_new_invoice() -> void:
	table.create_empty_table()
	current_invoice_id = latest_invoice_id + 1


func export_invoice() -> void:
	save_table(false)
	pending_invoices_list.remove_invoice(current_invoice_id)
	create_new_invoice()
	Logger.log_success("Rechnung exportiert")


func calculate_sum() -> void:
	table.calculate_sum()


func update_info() -> void:
	info.invoice_id.text = "Rechnungsnummer: " + str(current_invoice_id)
	info.person.text = "Person: " + current_customer
