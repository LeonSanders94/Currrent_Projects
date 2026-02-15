extends AnimatedSprite2D

var mouse_in:bool
@onready var button_group: CanvasGroup = $"../../.."
@onready var button: Node2D = $".."
signal button_ready(type,code)
func _ready():
	var self_name = str(self)
	emit_signal("Button",self_name.substr(25,-1)) 

func _process(_delta: float) -> void:
	if Input.is_action_just_released("select") and mouse_in == true:
		print("Pressed!")

func _on_button_area_mouse_entered() -> void:
	$".".frame = 1
	mouse_in = true

func _on_button_area_mouse_exited() -> void:
	$".".frame = 0
	mouse_in = false
