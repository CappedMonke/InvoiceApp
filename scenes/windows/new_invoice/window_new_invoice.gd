class_name WindowNewInvoice
extends WindowCustomers

func _on_create_new_invoice_button_pressed() -> void:
	var customer := _find_customer_by_name(input.text)
	if customer == null:
		Logger.log_error("Kunde konnte nicht gefunden werden!")
		return
	_create_new_invoice(customer)
	queue_free()

func _find_customer_by_name(string: String) -> Customer:
	for customer in PersistantData.customers:
		if customer.name.to_lower().contains(string.to_lower()):
			return customer
	return null

func _create_new_invoice(customer: Customer) -> void:
	Logger.log_not_implemented()
	#Logger.log_info("Neue Rechnung für Kunde \"" + customer.name + "\" angelegt.")
