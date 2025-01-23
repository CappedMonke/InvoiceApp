extends Window


func _on_close_requested() -> void:
	hide()


func _on_focus_exited() -> void:
	grab_focus()


func _on_create_button_pressed() -> void:
	InvoiceManager.save_table(true)
	InvoiceManager.create_new_invoice()
	InvoiceManager.update_info()
	hide()
