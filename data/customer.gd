class_name Customer
extends RefCounted

var name: String
var street: String
var house_number: String
var zip: String
var city: String
var email: String
var phone_number: String

func _init(_name: String, _street: String, _house_number: String, _zip: String, _city: String, _email := "", _phone_number := "") -> void:
	name = _name
	street = _street
	house_number = _house_number
	zip = _zip
	city = _city
	email = _email
	phone_number = _phone_number

func to_dictionary() -> Dictionary:
	var dictionary := {
		"name" = name,
		"street" = street,
		"house_number" = house_number,
		"zip" = zip,
		"city" = city,
		"email" = email,
		"phone_number" = phone_number
	}
	return dictionary

static func from_dictionary(dictionary: Dictionary) -> Customer:
	var _name = dictionary.name
	var _street = dictionary.street
	var _house_number = dictionary.house_number
	var _zip = dictionary.zip
	var _city = dictionary.city
	var _email = dictionary.email
	var _phone_number = dictionary.phone_number
	var new_customer = Customer.new(_name, _street, _house_number, _zip, _city, _email, _phone_number)
	return new_customer
