class_name Table
extends VBoxContainer


const TABLE_ENTRY = preload("res://scenes/table_row.tscn")


@onready var content: VBoxContainer = $Content


var last_row: TableRow = null


func _ready() -> void:
	InvoiceManager.table = self
	create_row()


func create_table_and_populate(data: Array) -> void:
	clear_table()
	var count_rows := data.size()
	for i in range(count_rows):
		var row = create_row()
		row.set_text(data[i])


func clear_table() -> void:
	for child in content.get_children():
		child.queue_free()


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
