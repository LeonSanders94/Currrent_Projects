extends AnimatedSprite2D


var mouse_in:bool



func _process(_delta: float) -> void:
	if Input.is_action_just_released("select") and mouse_in == true:
		print("Pressed!")
		emit_signal("Button") 

func _on_button_area_mouse_entered() -> void:
	$".".frame = 1
	mouse_in = true

func _on_button_area_mouse_exited() -> void:
	$".".frame = 0
	mouse_in = false
