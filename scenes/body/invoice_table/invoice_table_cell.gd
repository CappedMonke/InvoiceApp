class_name InvoiceTableCell
extends TextEdit

signal lost_focus_by_tab
signal lost_focus_by_shift_tab
signal request_save_invoice

var did_change := false

func _on_gui_input(_event: InputEvent) -> void:
	if not has_focus():
		return
	if Input.is_action_pressed("ui_focus_prev"):
		accept_event()
		_request_save_invoice()
		lost_focus_by_shift_tab.emit()
		find_prev_valid_focus().grab_focus()
		return
	if Input.is_action_pressed("ui_focus_next"):
		accept_event()
		_request_save_invoice()
		lost_focus_by_tab.emit()
		find_next_valid_focus().grab_focus()
		return

func _request_save_invoice() -> void:
	if did_change:
		request_save_invoice.emit()
	did_change = false

func _on_text_changed() -> void:
	did_change = true
