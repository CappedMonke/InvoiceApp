extends PanelContainer

const INVOICE_TABLE = preload("res://scenes/body/invoice_table/invoice_table.tscn")

@onready var table_container: HBoxContainer = $margin/h_box

var current_table: InvoiceTable = null

func _ready() -> void:
	PersistentData.new_invoice_to_display.connect(_on_new_invoice_to_display)

func _on_new_invoice_to_display(invoice: Invoice) -> void:
	create_table()
	current_table.initialize(invoice)

func create_table() -> void:
	if current_table != null:
		current_table.save_current_invoice()
		current_table.queue_free()
	current_table = INVOICE_TABLE.instantiate()
	table_container.add_child(current_table)
	
