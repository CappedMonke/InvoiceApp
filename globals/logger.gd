extends Node

var log_message: LogMessage = null

func log_info(message: String) -> void:
	log_message.log_info(message)

func log_success(message: String) -> void:
	log_message.log_success(message)

func log_warning(message: String) -> void:
	log_message.log_warning(message)

func log_error(message: String) -> void:
	log_message.log_error(message)
