class_name TableRow
extends HBoxContainer


signal new_row_requested


@onready var date_text: TextEditNoTab = $DateText
@onready var service_text: TextEditNoTab = $ServiceText
@onready var price_text: TextEditNoTab = $PriceText


func _on_price_text_lost_focus_by_tab() -> void:
	new_row_requested.emit()


func get_text() -> Array[String]:
	var strings: Array[String]
	strings.push_back(date_text.get_text())
	strings.push_back(service_text.get_text())
	strings.push_back(price_text.get_text())
	return strings


func set_text(text: Array) -> void:
	date_text.set_text(text[0])
	service_text.set_text(text[1])
	price_text.set_text(text[2])


func get_price() -> float:
	var price_string = price_text.get_text()
	price_string = price_string.replace(",", ".")
	return price_string.to_float()


func _on_price_text_text_changed() -> void:
	InvoiceManager.calculate_sum()


func is_empty() -> bool:
	return date_text.get_text() == "" and service_text.get_text() == "" and price_text.get_text() == ""
