class_name WindowCustomers
extends WindowBase

const WINDOW_CREATE_CUSTOMER = preload("res://scenes/windows/customers/window_create_customer.tscn")
const CUSTOMER_LIST_ENTRY = preload("res://scenes/windows/customers/customer_list_entry.tscn")

@onready var customer_list: VBoxContainer = $content/v_box/all_customers/v_box/scroll/customer_list
@onready var input: LineEdit = $content/v_box/customer_search/container/input
@onready var prediction: Label = $content/v_box/customer_search/container/prediction

var previous_text := ""
var previous_matching_customers: Array[Customer]

func _ready() -> void:
	super._ready()
	fill_customer_list()
	PersistantData.customers_updated.connect(_on_customers_updated)
	previous_matching_customers = PersistantData.customers

func _on_add_customer_button_pressed() -> void:
	var window_create_customer := WINDOW_CREATE_CUSTOMER.instantiate()
	add_child(window_create_customer)

func _on_customers_updated() -> void:
	for child in customer_list.get_children():
		child.queue_free()
	fill_customer_list()

func fill_customer_list() -> void:
	for customer in PersistantData.customers:
		var customer_list_entry := CUSTOMER_LIST_ENTRY.instantiate()
		customer_list.add_child(customer_list_entry)
		customer_list_entry.set_customer(customer)
		customer_list_entry.customer_selected.connect(_on_customer_selected)

func _on_input_text_changed(new_text: String) -> void:
	if new_text == "":
		prediction.text = new_text
		previous_matching_customers = PersistantData.customers
	else:
		var matching_customers: Array[Customer]
		if new_text.length() > previous_text.length():
			for customer in previous_matching_customers:
				if customer.name.to_lower().contains(new_text.to_lower()):
					matching_customers.push_back(customer)
		if new_text.length() < previous_text.length():
			for customer in PersistantData.customers:
				if customer.name.to_lower().contains(new_text.to_lower()):
					matching_customers.push_back(customer)
		previous_matching_customers = matching_customers
		if previous_matching_customers.size() > 0:
			var predicted_customer = previous_matching_customers[0]
			var first_part = new_text
			var second_part = predicted_customer.name.substr(first_part.length(), predicted_customer.name.length())
			prediction.text = first_part + second_part
	previous_text = new_text
	_update_customer_list()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_TAB:
			# Apply prediction
			input.text = prediction.text

func _on_customer_selected(customer: Customer) -> void:
	input.text = customer.name
	prediction.text = ""

func _update_customer_list() -> void:
	# TODO_PERFORMANCE
	for entry in customer_list.get_children():
		if previous_matching_customers.has((entry as CustomerListEntry).customer):
			entry.show()
			continue
		entry.hide()
