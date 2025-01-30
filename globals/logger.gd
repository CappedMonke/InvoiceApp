extends Node

var log_message: LogMessage = null

func log_info(message: String) -> void:
	print("Info: ", message)
	if log_message:
		log_message.log_info(message)

func log_success(message: String) -> void:
	print_rich("[color=#88e49c]Erfolg: ", message)
	if log_message:
		log_message.log_success(message)

func log_warning(message: String) -> void:
	print_rich("[color=#ecd957]Warnung: ", message)
	if log_message:
		log_message.log_warning(message)

func log_error(message: String) -> void:
	print_rich("[color=#ff7b63]Error: ", message)
	if log_message:
		log_message.log_error(message)

func log_not_implemented(function := "") -> void:
	if function == "":
		log_warning("Funktion wurde noch nicht implementiert!")
	log_warning(function + " wurde noch nicht implementiert!")
