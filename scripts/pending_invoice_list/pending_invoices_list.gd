class_name PendingInvoicesList
extends VBoxContainer


const PENDING_INVOICE_BUTTON = preload("res://scenes/pending_invoice_list/pending_invoice_button.tscn")


@onready var list: VBoxContainer = $ScrollContainer/VBoxContainer


var pending_invoice_ids: Array[int]


func _ready() -> void:
	InvoiceManager.pending_invoices_list = self


func add_invoice(invoice_id: int) -> void:
	if pending_invoice_ids.has(invoice_id):
		return
	pending_invoice_ids.push_back(invoice_id)
	var button := PENDING_INVOICE_BUTTON.instantiate()
	list.add_child(button)
	button.set_invoice_id(invoice_id)


func remove_invoice(invoice_id: int) -> void:
	var index := pending_invoice_ids.find(invoice_id)
	if index >= 0:
		pending_invoice_ids.remove_at(index)
		var pending_invoice_button = list.get_child(index)
		pending_invoice_button.queue_free()
