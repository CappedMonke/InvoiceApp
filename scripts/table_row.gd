class_name TableRow
extends HBoxContainer


signal new_row_requested


@onready var date_text: TextEdit = $DateText
@onready var service_text: TextEdit = $ServiceText
@onready var price_text: TextEdit = $PriceText


func _on_price_text_lost_focus_by_tab() -> void:
	new_row_requested.emit()


func get_text() -> Array[String]:
	var strings: Array[String]
	strings.push_back(date_text.text)
	strings.push_back(service_text.text)
	strings.push_back(price_text.text)
	return strings


func set_text(text: Array) -> void:
	date_text.text = text[0]
	service_text.text = text[1]
	price_text.text = text[2]
