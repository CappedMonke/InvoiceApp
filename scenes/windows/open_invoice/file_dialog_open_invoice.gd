class_name FileDialogOpenInvoice
extends FileDialog

func _ready() -> void:
	show()

func _on_file_selected(path: String) -> void:
	Logger.log_info("File opened: " + path)
	var invoice = PersistentData.load_invoice(path)
	PersistentData.display_invoice(invoice)

func _on_canceled() -> void:
	queue_free()
