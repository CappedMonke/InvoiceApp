class_name LogMessage
extends HBoxContainer

const INFO = preload("res://assets/icons/info.svg")
const SUCCESS = preload("res://assets/icons/success.svg")
const WARNING = preload("res://assets/icons/warning.svg")
const ERROR = preload("res://assets/icons/error.svg")

const COLOR_INFO := Color.WHITE
const COLOR_SUCCESS := Color("#8ff0a4")
const COLOR_WARNING := Color("#f8e45c")
const COLOR_ERROR := Color("#ff7b63")

const DURATION := 2.0

@onready var label: Label = $message
@onready var icon: TextureRect = $margin/icon

func _ready() -> void:
	hide()
	Logger.log_message = self

func _set_log(message: String, texture: Texture2D, color: Color) -> void:
	show()
	label.text = message
	icon.texture = texture
	modulate = color
	await get_tree().create_timer(DURATION).timeout
	hide()

func log_info(message: String) -> void:
	_set_log(message, INFO, COLOR_INFO)

func log_success(message: String) -> void:
	_set_log(message, SUCCESS, COLOR_SUCCESS)

func log_warning(message: String) -> void:
	_set_log(message, WARNING, COLOR_WARNING)

func log_error(message: String) -> void:
	_set_log(message, ERROR, COLOR_ERROR)
