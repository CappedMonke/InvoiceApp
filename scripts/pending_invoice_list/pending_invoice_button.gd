extends Button


var invoice_id: int


@onready var label: Label = $MarginContainer/Label


func set_invoice_id(id: int) -> void:
	self.invoice_id = id
	label.text = str(invoice_id)


func _on_pressed() -> void:
	InvoiceManager.load_table(invoice_id)
