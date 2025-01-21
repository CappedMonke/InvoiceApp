extends HBoxContainer


@onready var open_file_dialog: FileDialog = $OpenFileDialog
@onready var new_window: Window = $NewWindow
@onready var shortcuts_window: Window = $ShortcutsWindow
@onready var settings_window: Window = $SettingsWindow


func _on_new_pressed() -> void:
	new_window.show()


func _on_open_pressed() -> void:
	open_file_dialog.show()


func _on_save_pressed() -> void:
	pass # Replace with function body.


func _on_export_pressed() -> void:
	pass # Replace with function body.


func _on_shortcuts_pressed() -> void:
	shortcuts_window.show()


func _on_settings_pressed() -> void:
	settings_window.show()


func _on_open_file_dialog_file_selected(path: String) -> void:
	var file = FileAccess.open(path, FileAccess.READ)
	var json_text = file.get_as_text()
	var data = JSON.parse_string(json_text)


func _on_new_window_close_requested() -> void:
	new_window.hide()


func _on_shortcuts_window_close_requested() -> void:
	shortcuts_window.hide()


func _on_settings_window_close_requested() -> void:
	settings_window.hide()
