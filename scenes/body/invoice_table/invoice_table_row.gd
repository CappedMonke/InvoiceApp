class_name InvoiceTableRow
extends Control

@onready var data := InvoiceRowData.new()
@onready var date_input: TextEdit = $header/date_input
@onready var service_input: TextEdit = $header/service_input
@onready var price_input: TextEdit = $header/price_input

var is_deletable := true

func populate(_data: InvoiceRowData):
	data = _data
	date_input.text = _data.date
	service_input.text = _data.service
	price_input.text = _data.price

func _on_date_input_text_changed() -> void:
	data.date = date_input.text

func _on_service_input_text_changed() -> void:
	data.service = service_input.text

func _on_price_input_text_changed() -> void:
	data.price = price_input.text
