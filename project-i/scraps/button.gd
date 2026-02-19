extends Button

signal button_press(BID)
signal pressed_flag_false(BID)
signal pressed_flag_true(BID)


var button_name = str(self)
var button_id = button_name.substr(7,12)
var BID = "BID" + button_id

func _ready():
	button_press.emit(BID) 
	_check_up()

func _check_up():
	pressed_flag_false.emit(BID)
	#print(BID," :NOT PRESSED")
	
	if self.is_in_group("GArea"):
		self.icon = preload("res://assets/X.png")
	elif self.is_in_group("inv"):
		self.icon = preload("res://assets/empty_pipe_slot.png")

func _check_down():
	if self.is_in_group("GArea"):
		if MGM.current_selection != "":
			set_pressed_no_signal(true)
			pressed_flag_true.emit(BID)
		else:
			set_pressed_no_signal(false)
			_check_up()
	elif self.is_in_group("inv"):
		if MGM.current_selection == "":
			set_pressed_no_signal(true)
			pressed_flag_true.emit(BID)
		else:
			set_pressed_no_signal(false)
			_check_up()

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		_check_down()
	else:
		set_pressed_no_signal(false)
		_check_up()
