extends GridContainer

@export var grid_rows: int = 3
@export var grid_columns: int = 3

var grid_data: Array = []
var buttons: Array = []

const BUTTON_SCENE = preload("res://butt_1.tscn")

func _ready():
	_create_grid()

func _create_grid():
	columns = grid_columns  # Set GridContainer columns
	
	var total_buttons = grid_rows * grid_columns
	grid_data.resize(total_buttons)
	grid_data.fill(null)
	
	for i in range(total_buttons):
		var button = BUTTON_SCENE.instantiate()
		button.grid_index = i
		button.button_pressed.connect(_on_button_pressed)
		
		add_child(button)
		buttons.append(button)
		button.update_display(null)

func _on_button_pressed(index: int):
	print("Grid button %d pressed, contains: %s" % [index, grid_data[index]])
	# Do whatever you want with this info

func set_item(index: int, item_data) -> void:
	grid_data[index] = item_data
	buttons[index].update_display(item_data)

func get_item(index: int):
	return grid_data[index]

func clear_item(index: int) -> void:
	set_item(index, null)
