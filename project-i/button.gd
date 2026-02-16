extends Button


var pressed_flag:bool



func _check_up():
	if pressed_flag == false:
		print(self.name,self.position," :NOT PRESSED")
		self.icon = preload("res://assets/empty_pipe_slot.png")
	else:
		pass

func _check_down():
	if pressed_flag == true:
		print(self.name,self.position," :PRESSED")
		self.icon = preload("res://assets/X.png")
		if self.is_in_group("GArea"):
			print("I'm in GArea")
		elif self.is_in_group("inv"):  # Changed to elif
			print("I'm in inv")
		else:
			print("I think I'm an Orphan", self.get_groups())
	else:
		pass

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		pressed_flag = true
		_check_down()
	if toggled_on == false:
		pressed_flag = false
		_check_up()
	
	
