extends Control

const WINDOW_NEW_INVOICE = preload("res://scenes/windows/new_invoice/window_new_invoice.tscn")
const FILE_DIALOG_OPEN_INVOICE = preload("res://scenes/windows/open_invoice/file_dialog_open_invoice.tscn")
const WINDOW_CUSTOMERS = preload("res://scenes/windows/customers/window_customers.tscn")
const WINDOW_SHORTCUTS = preload("res://scenes/windows/shortcuts/window_shortcuts.tscn")

var window_new_invoice: WindowNewInvoice = null
var file_dialog_open_invoice: FileDialogOpenInvoice = null
var window_customers: WindowCustomers = null
var window_shortcuts: WindowShortcuts = null

func _on_new_button_pressed() -> void:
	if window_new_invoice != null:
		Logger.log_info("Fenster ist bereits offen!")
		return
	window_new_invoice = WINDOW_NEW_INVOICE.instantiate()
	add_child(window_new_invoice)

func _on_open_button_pressed() -> void:
	if file_dialog_open_invoice != null:
		Logger.log_info("Fenster ist bereits offen!")
		return
	file_dialog_open_invoice = FILE_DIALOG_OPEN_INVOICE.instantiate()
	add_child(file_dialog_open_invoice)

func _on_complete_button_pressed() -> void:
	Logger.log_not_implemented()

func _on_shortcuts_button_pressed() -> void:
	if window_shortcuts != null:
		Logger.log_info("Fenster ist bereits offen!")
		return
	window_shortcuts = WINDOW_SHORTCUTS.instantiate()
	add_child(window_shortcuts)

func _on_customers_button_pressed() -> void:
	if window_customers != null:
		Logger.log_info("Fenster ist bereits offen!")
		return
	window_customers = WINDOW_CUSTOMERS.instantiate()
	add_child(window_customers)
