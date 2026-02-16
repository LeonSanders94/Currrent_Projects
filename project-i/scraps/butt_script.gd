extends Button

signal grid_cell_pressed(index)  # Renamed to avoid conflict

var grid_index: int = -1

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	grid_cell_pressed.emit(grid_index)  # Updated

func update_display(item_data) -> void:
	if item_data == null:
		text = "Empty"
	else:
		text = str(item_data)
