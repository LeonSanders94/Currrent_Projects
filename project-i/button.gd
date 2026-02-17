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
	pressed_flag_true.emit(BID)
	print(BID," :PRESSED")

	if self.is_in_group("GArea"):
		if MGM.current_selection != "":
			print(BID,": I'm in GArea")
		else:
			_check_up()
	elif self.is_in_group("inv"):
		if MGM.current_selection == "":
			print(BID,": I'm in inv")
		else:
			_check_up()
	else:
		print(BID,": I think I'm an Orphan", self.get_groups())

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		_check_down()
	if toggled_on == false:
		_check_up()
	
	
