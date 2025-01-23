class_name LogDisplay
extends HBoxContainer

const INFO = preload("res://assets/info.svg")
const SUCCESS = preload("res://assets/success.svg")
const WARNING = preload("res://assets/warning.svg")
const ERROR = preload("res://assets/error.svg")
const LOG_TIMEOUT = 2

@onready var text: Label = $Label
@onready var icon: TextureRect = $MarginContainer/TextureRect
@onready var timer: Timer = $Timer


func _ready() -> void:
	Logger.log_display = self


func log_normal(message: String) -> void:
	log_base(message, INFO, Color.WHITE)


func log_success(message: String) -> void:
	log_base(message, SUCCESS, Color.GREEN)


func log_warning(message: String) -> void:
	log_base(message, WARNING, Color.ORANGE)


func log_error(message: String) -> void:
	log_base(message, ERROR, Color.RED)


func log_base(message: String, texture: Texture2D, color: Color):
	show()
	text.text = message
	icon.texture = texture
	icon.modulate = color
	timer.start(LOG_TIMEOUT)


func _on_timer_timeout() -> void:
	hide()
