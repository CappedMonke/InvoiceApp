class_name InvoiceRow
extends RefCounted

var date: String
var service: String
var price: String

func _init(_date := "", _service := "", _price := "") -> void:
	date = _date
	service = _service
	price = _price

func to_dictionary() -> Dictionary:
	var dictionary := {
		"date" = date,
		"service" = service,
		"price" = price
	}
	return dictionary

static func from_dictionary(dictionary: Dictionary) -> InvoiceRow:
	var _date = dictionary.date
	var _service = dictionary.service
	var _price = dictionary.price
	return InvoiceRow.new(_date, _service, _price)
