class_name Invoice
extends RefCounted

var id: String
var customer_id: String
var date: String
var table: Array[InvoiceRow]

func _init(_customer_id: String, _id := "", _date := "", _table: Array[InvoiceRow] = []) -> void:
	id = _id
	customer_id = _customer_id
	date = _date
	table = _table
	if id == "":
		id = str(get_instance_id())
	if date == "":
		var today = Time.get_date_dict_from_system()
		date = str(today.year) + "." + str(today.month) + "." + str(today.day)

func to_dictionary() -> Dictionary:
	var dictionary := {
		"id" = id,
		"customer_id" = customer_id,
		"date" = date,
		"table" = table
	}
	return dictionary

static func from_dictionary(dictionary: Dictionary) -> Invoice:
	var _id = dictionary.id
	var _customer_id = dictionary.customer_id
	var _date = dictionary.date
	var _table: Array[InvoiceRow]
	for row in dictionary.table:
		_table.push_back(InvoiceRow.from_dictionary(row))
	return Invoice.new(_id, _customer_id, _date, _table)
