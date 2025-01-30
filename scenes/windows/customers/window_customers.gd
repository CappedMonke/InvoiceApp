class_name WindowCustomers
extends WindowBase

const WINDOW_CREATE_CUSTOMER = preload("res://scenes/windows/customers/window_create_customer.tscn")
const CUSTOMER_LIST_ENTRY = preload("res://scenes/windows/customers/customer_list_entry.tscn")

@onready var customer_list: VBoxContainer = $content/v_box/all_customers/v_box/scroll/customer_list
@onready var input: LineEdit = $content/v_box/customer_search/container/input
@onready var prediction: Label = $content/v_box/customer_search/container/prediction

func _ready() -> void:
	super._ready()
	fill_customer_list()
	PersistantData.customers_updated.connect(_on_customers_updated)

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
	for customer in PersistantData.customers:
		if customer.name.contains(new_text):
			prediction.text = customer.name

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_TAB:
			# Apply prediction
			input.text = prediction.text

func _on_customer_selected(customer: Customer) -> void:
	Logger.log_not_implemented()
