extends Node

signal customers_updated

const PERSISTENT_DIRECTORY := "/Daten"
const CUSTOMER_DATA_PATH := PERSISTENT_DIRECTORY + "/Kunden.json"
const INVOICES_DIRECTORY := PERSISTENT_DIRECTORY + "/Rechungen"
const UNFINISHED_INVOICES_DIRECTORY := INVOICES_DIRECTORY + "/Laufend"
const FINISHED_INVOICES_DIRECTORY := INVOICES_DIRECTORY + "/Abgeschlossen"
const EXPORTED_INVOICES_DIRECTORY := INVOICES_DIRECTORY + "/Exportiert"

var customer_data_absolute_path: String
var unfinished_invoices_absolute_directory: String
var finished_invoices_absolute_directory: String
var exported_invoices_absolute_directory: String

var customers: Array[Customer]
var unfinished_invoices: Array[Invoice]

func _ready() -> void:
	var user_data_directory := OS.get_user_data_dir()
	customer_data_absolute_path = user_data_directory + CUSTOMER_DATA_PATH
	unfinished_invoices_absolute_directory = user_data_directory + UNFINISHED_INVOICES_DIRECTORY
	finished_invoices_absolute_directory = user_data_directory + FINISHED_INVOICES_DIRECTORY
	exported_invoices_absolute_directory = user_data_directory + EXPORTED_INVOICES_DIRECTORY
	_ensure_directory_exists(unfinished_invoices_absolute_directory)
	_ensure_directory_exists(finished_invoices_absolute_directory)
	_ensure_directory_exists(exported_invoices_absolute_directory)
	_load_customer_data()
	_load_unfinished_invoices()

func _ensure_directory_exists(path: String) -> void:
	if not DirAccess.dir_exists_absolute(path):
		Logger.log_info("Das Verzeichnis \"" + path + "\" existiert nicht. Erstelle Verzeichnis...")
		DirAccess.make_dir_recursive_absolute(path)

func _load_customer_data() -> void:
	if not FileAccess.file_exists(customer_data_absolute_path):
		Logger.log_error("Die Datei \"" + customer_data_absolute_path + "\" existiert nicht. Es konnten keine Kundendaten geladen werden.")
		return
	var file = FileAccess.open(customer_data_absolute_path, FileAccess.READ)
	var customers_data = JSON.parse_string(file.get_as_text())
	if customers_data == null:
		Logger.log_warning("Kundendaten sind leer.")
		return
	for data in customers_data:
		var new_customer = Customer.from_dictionary(data)
		customers.push_back(new_customer)

func save_customer_data() -> void:
	var file = FileAccess.open(customer_data_absolute_path, FileAccess.WRITE)
	var customers_data: Array[Dictionary]
	for customer in customers:
		customers_data.push_back(customer.to_dictionary())
	var json_string = JSON.stringify(customers_data, "\t")
	file.store_string(json_string)
	customers_updated.emit()

func _load_unfinished_invoices() -> void:
	pass

func _save_unfinished_invoices() -> void:
	pass

func add_customer(customer: Customer) -> void:
	customers.push_back(customer)
	save_customer_data()

func delete_customer(customer: Customer) -> void:
	customers.erase(customer)
	save_customer_data()
