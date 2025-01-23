class_name Table
extends VBoxContainer


const TABLE_ENTRY = preload("res://scenes/table/table_row.tscn")


@onready var content: VBoxContainer = $Content
@onready var sum_label: Label = $Summary/Sum


var last_row: TableRow = null


func _ready() -> void:
	InvoiceManager.table = self


func create_empty_table() -> void:
	clear_table()
	create_row()


func create_table_and_populate(data: Array) -> void:
	clear_table()
	var count_rows := data.size()
	for i in range(count_rows):
		var row = create_row()
		row.set_text(data[i])
	calculate_sum()


func clear_table() -> void:
	last_row = null
	for child in content.get_children():
		child.free()
	sum_label.text = "0.00"


func set_last_row(row: TableRow) -> void:
	if last_row:
		last_row.new_row_requested.disconnect(create_row)
	last_row = row
	last_row.new_row_requested.connect(create_row)


func create_row() -> TableRow:
	var row = TABLE_ENTRY.instantiate()
	content.add_child(row)
	set_last_row(row)
	return row


func delete_row(row: TableRow) -> void:
	if row.new_row_requested.is_connected(create_row):
		row.new_row_requested.disconnect(create_row)
	content.remove_child(row)
	row.queue_free()


func get_data() -> String:
	var data: Array
	for row in content.get_children():
		data.push_back((row as TableRow).get_text())
	return JSON.stringify(data)


func calculate_sum() -> void:
	var sum: float = 0
	for row in content.get_children():
		sum += (row as TableRow).get_price()
	sum_label.text = "%.2f" % sum


func is_empty() -> bool:
	var is_empty_ := true
	for row in content.get_children():
		if not (row as TableRow).is_empty():
			is_empty_ = false
			break
	return is_empty_
