class_name WindowNewInvoice
extends WindowBase

signal create_new_invoice(customer_name: String)

@onready var customer_input: LineEdit = $content/v_box/customer/customer_input

func _on_create_invoice_pressed() -> void:
	var customer_name := customer_input.text
	if customer_name == "":
		Logger.log_error("Kundenname nicht verfügbar!")
		return
	create_new_invoice.emit(customer_name)
	queue_free()
