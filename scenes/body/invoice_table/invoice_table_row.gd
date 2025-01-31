class_name InvoiceTableRow
extends Control

signal create_new_row
signal pre_row_deletion(row: InvoiceTableRow)
signal request_save_invoice

@onready var data := InvoiceRowData.new()
@onready var date_input: TextEdit = $date_input
@onready var service_input: TextEdit = $service_input
@onready var price_input: TextEdit = $price_input

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

func _on_price_input_lost_focus_by_tab() -> void:
	create_new_row.emit()

func _on_date_input_lost_focus_by_shift_tab() -> void:
	if is_row_empty() and is_deletable:
		pre_row_deletion.emit(self)
		queue_free()

func is_row_empty() -> bool:
	return date_input.text == "" and service_input.text == "" and price_input.text == ""

func _on_date_input_request_save_invoice() -> void:
	request_save_invoice.emit()

func _on_service_input_request_save_invoice() -> void:
	request_save_invoice.emit()

func _on_price_input_request_save_invoice() -> void:
	request_save_invoice.emit()
