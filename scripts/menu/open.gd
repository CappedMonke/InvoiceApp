extends Button


@onready var open_file_dialog: FileDialog = $OpenFileDialog


func _on_pressed() -> void:
	open_file_dialog.show()


func _on_open_file_dialog_close_requested() -> void:
	open_file_dialog.hide()


func _on_open_file_dialog_file_selected(path: String) -> void:
	var file = FileAccess.open(path, FileAccess.READ)
	var json_text = file.get_as_text()
	var data = JSON.parse_string(json_text)
