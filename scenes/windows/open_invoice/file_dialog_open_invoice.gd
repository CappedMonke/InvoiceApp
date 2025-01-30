class_name FileDialogOpenInvoice
extends FileDialog

func _ready() -> void:
	var invoice = Invoice.new("-9223371914951522845")
	PersistantData.save_invoice(invoice, PersistantData.unfinished_invoices_absolute_directory)
	show()

func _on_file_selected(path: String) -> void:
	Logger.log_info("File opened: " + path)
	Logger.log_not_implemented()

func _on_canceled() -> void:
	queue_free()
