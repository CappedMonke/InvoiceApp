class_name Invoice
extends RefCounted

var id: String
var number: String
var customer_id: String
var date: String
var table: Array[InvoiceRowData]

func _init(_customer_id: String, _number: String, _id := "", _date := "", _table: Array[InvoiceRowData] = []) -> void:
	id = _id
	number = _number
	customer_id = _customer_id
	date = _date
	table = _table
	if id == "":
		id = str(get_instance_id())
	if date == "":
		var today = Time.get_date_dict_from_system()
		date = str(today.year) + "." + str(today.month) + "." + str(today.day)

func to_dictionary() -> Dictionary:
	var _table: Array
	for data in table:
		_table.push_back(data.to_dictionary())
	var dictionary := {
		"id" = id,
		"number" = number,
		"customer_id" = customer_id,
		"date" = date,
		"table" = _table
	}
	return dictionary

static func from_dictionary(dictionary: Dictionary) -> Invoice:
	var _id = dictionary.id
	var _number = dictionary.number
	var _customer_id = dictionary.customer_id
	var _date = dictionary.date
	var _table: Array[InvoiceRowData]
	for data in dictionary.table:
		_table.push_back(InvoiceRowData.from_dictionary(data))
	return Invoice.new(_id, _number, _customer_id, _date, _table)
