class_name Info
extends VBoxContainer


@onready var person: Label = $PanelContainer/MarginContainer/Person
@onready var invoice_id: Label = $PanelContainer2/MarginContainer/InvoiceId


func _ready() -> void:
	InvoiceManager.info = self
