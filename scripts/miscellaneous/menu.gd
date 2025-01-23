extends PanelContainer

@onready var new_window: Window = $Buttons/NewButton/Window
@onready var open_window: FileDialog = $Buttons/OpenButton/FileDialog
@onready var shortcuts_window: Window = $Buttons/ShortcutsButton/Window
@onready var customers_window: Window = $Buttons/CustomersButton/Window
@onready var settings_window: Window = $Buttons/SettingsButton/Window


func _on_new_button_pressed() -> void:
	new_window.show()


func _on_open_button_pressed() -> void:
	open_window.show()


func _on_file_dialog_file_selected(path: String) -> void:
	var regex = RegEx.new()
	if regex.compile(r"/(\d+)\.json$") == OK:
		var regex_match = regex.search(path)
		if regex_match:
			var invoice_id = int(regex_match.get_string(1))
			InvoiceManager.load_table(invoice_id)


func _on_save_button_pressed() -> void:
	InvoiceManager.save_table(true)


func _on_export_button_pressed() -> void:
	InvoiceManager.export_invoice()


func _on_shortcuts_button_pressed() -> void:
	shortcuts_window.show()


func _on_settings_button_pressed() -> void:
	settings_window.show()


func _on_customers_button_pressed() -> void:
	customers_window.show()
