extends Button

signal button_press(button_name)

var pressed_flag:bool
var button_name = str(self)
var button_id = button_name.substr(7,12)
var BID = "BID" + button_id
func _check_up():
	if pressed_flag == false:
		print(BID," :NOT PRESSED")
		self.icon = preload("res://assets/empty_pipe_slot.png")
	else:
		pass

func _ready():
	button_press.emit(name) 
func _check_down():
	if pressed_flag == true:
		print(BID," :PRESSED")
		self.icon = preload("res://assets/X.png")
		if self.is_in_group("GArea"):
			print("I'm in GArea")
			print(BID)
		elif self.is_in_group("inv"):  # Changed to elif
			print("I'm in inv")
			print(BID)
		else:
			print("I think I'm an Orphan", self.get_groups())
			print(BID)
	else:
		pass

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		pressed_flag = true
		_check_down()
	if toggled_on == false:
		pressed_flag = false
		_check_up()
	
	
