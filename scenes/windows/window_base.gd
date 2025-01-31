class_name WindowBase
extends Window

func _ready() -> void:
	close_requested.connect(_on_close_requested)
	set_process_input(true)

func _process(_delta: float) -> void:
	if not has_focus():
		return
	if Input.is_action_pressed("ui_cancel"):
		_on_close_requested()

func _on_close_requested():
	queue_free()
