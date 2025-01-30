class_name FileDialogOpenInvoice
extends FileDialog

func _ready() -> void:
	show()

func _on_file_selected(path: String) -> void:
	Logger.log_not_implemented()
	Logger.log_info("File opened: " + path)

func _on_canceled() -> void:
	queue_free()
