class_name CustomerListEntry
extends Control

signal customer_selected(customer: Customer)

const WINDOW_CREATE_CUSTOMER = preload("res://scenes/windows/customers/window_create_customer.tscn")
const WINDOW_CONFIRMATION = preload("res://scenes/windows/confirmation/window_confirmation.tscn")

@onready var customer_name: Label = $margin/h_box/customer/customer_name

var customer: Customer = null

func set_customer(_customer: Customer) -> void:
	customer = _customer
	customer_name.text = customer.name + " (" + customer.street + ", " + customer.city + ")"

func _on_edit_button_pressed() -> void:
	var window_create_customer := WINDOW_CREATE_CUSTOMER.instantiate()
	add_child(window_create_customer)
	window_create_customer.edit_customer(customer)

func _on_delete_button_pressed() -> void:
	var window_confirmation := WINDOW_CONFIRMATION.instantiate()
	add_child(window_confirmation)
	var confirmation_string := "Soll Kunde \"" + customer.name + "\" wirklich gelöscht werden?"
	window_confirmation.initialize(confirmation_string)
	window_confirmation.action_confirmed.connect(PersistentData.delete_customer.bind(customer))

func _on_customer_button_pressed() -> void:
	customer_selected.emit(customer)
