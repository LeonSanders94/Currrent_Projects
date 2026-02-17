extends GridContainer
@export var grid_group_name:String = ""
@export var GRID_CELL:PackedScene

var grid_registry = []
var action_director

##Grid Maker##
@export var width:int = 5:
	set(value): 
		width = value
		_remove_grid()
		_create_grid()
@export var height := 5:
	set(value): 
		height = value
		_remove_grid()
		_create_grid()
@export var cellWidth := 100:
	set(value): 
		cellWidth = value
		_remove_grid()
		_create_grid()
@export var cellHeight := 100:
	set(value):
		cellHeight = value
		_remove_grid()
		_create_grid()
@export var borderSize = 0:
	set(value):
		borderSize = value
		_remove_grid()
		_create_grid()
####

func _create_grid():
	add_theme_constant_override("h_separation", borderSize)
	add_theme_constant_override("v_separation", borderSize)
	
	columns = width
	for i in width * height:
		var gridCellNode = GRID_CELL.instantiate()
		gridCellNode.custom_minimum_size = Vector2(cellWidth, cellHeight)
		add_child(gridCellNode)
		if grid_group_name != "":
			var button = gridCellNode.get_node("Button")
			button.add_to_group(grid_group_name)
		_register_buttons(gridCellNode)

	print(grid_group_name)
func _remove_grid():
	for node in get_children():
		node.queue_free()

##SIGNAL CONTROLLER##
func _register_buttons(gridCellNode):
	action_director = gridCellNode
	for child in gridCellNode.get_children():
		if child.has_signal("button_press"):
			child.button_press.connect(_button_press)
		if child.has_signal("pressed_flag_false"):
			child.pressed_flag_false.connect(_button_unpressed)
		if child.has_signal("pressed_flag_true"):
			child.pressed_flag_true.connect(_button_pressed)
##
##Registration to Grid "grid_resgistry" Array##
var counter = 0
var finisher:bool
func _button_press(BID: String):
	grid_registry.append(BID)
	var limiter = width * height
	if counter < limiter:
		counter += 1
		finisher = false
	elif counter >= limiter and finisher == false:
		print("Grid Registry ",self.name,": ",grid_registry)
		finisher = true
		
####
##Signals from Buttons##

##^^-sceneroot game manager-^^##
func _button_unpressed(BID):
	print(BID,", Grid received: button unpressed signal")

func _button_pressed(BID):
	print(BID,"Grid received: button pressed signal")
	if grid_group_name == "GArea":
		if MGM.current_selection != "":
			print(MGM.current_selection, "Placed at", BID)
		else:
			print("No Item selected, select an item from Inv First.")

####
