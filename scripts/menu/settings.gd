extends Button


@onready var settings_window: Window = $SettingsWindow


func _on_pressed() -> void:
	settings_window.show()


func _on_settings_window_focus_exited() -> void:
	settings_window.hide()


func _on_settings_window_close_requested() -> void:
	settings_window.hide()
