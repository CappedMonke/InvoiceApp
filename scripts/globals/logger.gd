extends Node


var log_display: LogDisplay = null


func log_normal(message: String) -> void:
	log_display.log_normal(message)


func log_success(message: String) -> void:
	log_display.log_success(message)


func log_warning(message: String) -> void:
	log_display.log_warning(message)


func log_error(message: String) -> void:
	log_display.log_error(message)
