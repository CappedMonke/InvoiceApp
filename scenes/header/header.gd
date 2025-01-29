extends PanelContainer

const WINDOW_NEW_INVOICE = preload("res://scenes/windows/window_new_invoice.tscn")

func _on_new_button_pressed() -> void:
	var window_new_invoice := WINDOW_NEW_INVOICE.instantiate()
	add_child(window_new_invoice)

func _on_open_button_pressed() -> void:
	Logger.log_warning("Feature not implemented yet!")

func _on_complete_button_pressed() -> void:
	Logger.log_warning("Feature not implemented yet!")

func _on_shortcuts_button_pressed() -> void:
	Logger.log_warning("Feature not implemented yet!")

func _on_customers_button_pressed() -> void:
	Logger.log_warning("Feature not implemented yet!")
