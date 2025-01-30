class_name WindowBase
extends Window

func _ready() -> void:
	close_requested.connect(_on_close_requested)
	set_process_input(true)

func _on_close_requested():
	queue_free()
