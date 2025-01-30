class_name WindowConfirmation
extends WindowBase

@onready var description_label: Label = $content/v_box/description_label
@onready var cancel_button: Button = $content/v_box/buttons/cancel_button
@onready var confirm_button: Button = $content/v_box/buttons/confirm_button

signal action_confirmed

func initialize(description: String, cancel_text := "Abbrechen", confirm_text := "Bestätigen") -> void:
	description_label.text = description
	cancel_button.text = cancel_text
	confirm_button.text = confirm_text

func _on_confirm_button_pressed() -> void:
	action_confirmed.emit()

func _on_cancel_button_pressed() -> void:
	queue_free()
