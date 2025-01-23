class_name TextEditNoTab
extends PanelContainer


signal lost_focus_by_tab
signal lost_focus_by_shift_tab
signal text_changed


@onready var text_edit: TextEdit = $MarginContainer/TextEdit


func _ready() -> void:
	text_edit.get_h_scroll_bar().modulate.a = 0


func set_text(text: String) -> void:
	text_edit.text = text


func get_text() -> String:
	return text_edit.text


func _on_text_edit_gui_input(event: InputEvent) -> void:
	if text_edit.has_focus():
		if event.is_action_pressed("ui_focus_prev"):
			get_viewport().set_input_as_handled()
			lost_focus_by_shift_tab.emit()
		elif event.is_action_pressed("ui_focus_next"):
			get_viewport().set_input_as_handled()
			lost_focus_by_tab.emit()


func _on_text_edit_focus_entered() -> void:
	var stylebox_focused = get_theme_stylebox("panel").duplicate()
	stylebox_focused.border_color = Color("#007fd4")
	add_theme_stylebox_override("panel", stylebox_focused)


func _on_text_edit_focus_exited() -> void:
	var stylebox_normal = get_theme_stylebox("panel").duplicate()
	stylebox_normal.border_color = Color("#252526")
	add_theme_stylebox_override("panel", stylebox_normal)


func _on_text_edit_text_changed() -> void:
	text_changed.emit()
