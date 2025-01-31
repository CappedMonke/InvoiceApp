class_name WindowEditCustomer
extends WindowBase

@onready var name_input: LineEdit = $content/v_box/h_box/inputs/name_input
@onready var name_label: Label = $content/v_box/h_box/labels/name_label
@onready var street_input: LineEdit = $content/v_box/h_box/inputs/street_input
@onready var street_label: Label = $content/v_box/h_box/labels/street_label
@onready var house_number_input: LineEdit = $content/v_box/h_box/inputs/house_number_input
@onready var house_number_label: Label = $content/v_box/h_box/labels/house_number_label
@onready var zip_input: LineEdit = $content/v_box/h_box/inputs/zip_input
@onready var zip_label: Label = $content/v_box/h_box/labels/zip_label
@onready var city_input: LineEdit = $content/v_box/h_box/inputs/city_input
@onready var city_label: Label = $content/v_box/h_box/labels/city_label
@onready var email_label: Label = $content/v_box/h_box/labels/email_label
@onready var email_input: LineEdit = $content/v_box/h_box/inputs/email_input
@onready var phone_number_input: LineEdit = $content/v_box/h_box/inputs/phone_number_input
@onready var phone_number_label: Label = $content/v_box/h_box/labels/phone_number_label
@onready var create_customer_button: Button = $content/v_box/create_customer_button

var customer: Customer = null

func edit_customer(_customer: Customer) -> void:
	title = "Kunde Bearbeiten"
	create_customer_button.text = "Bearbeiten"
	customer = _customer
	name_input.text = customer.name
	street_input.text = customer.street
	house_number_input.text = customer.house_number
	zip_input.text = customer.zip
	city_input.text = customer.city
	email_input.text = customer.email
	phone_number_input.text = customer.phone_number

func _on_create_customer_pressed() -> void:
	var quit_early = false
	quit_early = quit_early or not _is_input_valid(name_label, name_input.text)
	quit_early = quit_early or not _is_input_valid(street_label, street_input.text)
	quit_early = quit_early or not _is_input_valid(house_number_label, house_number_input.text)
	quit_early = quit_early or not _is_input_valid(zip_label, zip_input.text)
	quit_early = quit_early or not _is_input_valid(city_label, city_input.text)
	if quit_early:
		return
	
	# Update customer
	if customer != null:
		customer.name = name_input.text
		customer.street = street_input.text
		customer.house_number = house_number_input.text
		customer.zip = zip_input.text
		customer.city = city_input.text
		customer.email = email_input.text
		customer.phone_number = phone_number_input.text
		PersistentData.save_customer_data()
		return
	
	# Create new customer
	var new_customer = Customer.new(
		name_input.text, 
		street_input.text, 
		house_number_input.text, 
		zip_input.text, 
		city_input.text,
		email_input.text,
		phone_number_input.text)
	PersistentData.add_customer(new_customer)
	queue_free()

func _is_input_valid(label: Label, input: String) -> bool:
	if input == "":
		var text_without_colon := label.text.substr(0, label.text.length() - 1)
		Logger.log_error("Feld \"" + text_without_colon + "\" darf nicht leer sein!")
		return false
	return true
