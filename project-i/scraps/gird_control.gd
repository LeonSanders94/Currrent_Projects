extends GridContainer

@export var Grid_rows: int = 3
@export var grid_columns: int = 3

var grid_data: Array = []
var buttons: Array = []

# Remove the preload, create buttons in code instead
func _ready():
	_create_grid()

func _create_grid():
	columns = columns
	
	var total_buttons = Grid_rows * grid_columns
	grid_data.resize(total_buttons)
	grid_data.fill(null)
	
	for i in range(total_buttons):
		var button = Button.new()  # Create button directly
		button.set_script(preload("res://butt_script.gd"))  # Attach script
		button.grid_index = i
		button.grid_cell_pressed.connect(_on_button_pressed)
		
		add_child(button)
		buttons.append(button)
		button.update_display(null)
