extends TextEdit


signal lost_focus_by_tab
signal lost_focus_by_shift_tab





func _ready() -> void:
	get_h_scroll_bar().modulate.a = 0


func _on_gui_input(event: InputEvent) -> void:
	if has_focus():
		if event.is_action_pressed("ui_focus_prev"):
			get_viewport().set_input_as_handled()
			lost_focus_by_shift_tab.emit()
		elif event.is_action_pressed("ui_focus_next"):
			get_viewport().set_input_as_handled()
			lost_focus_by_tab.emit()
