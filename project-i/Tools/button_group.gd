extends CanvasGroup

@onready var button_group: CanvasGroup = $"."
@export var button:PackedScene
var grid_row = []
var grid_column = []


func _ready() -> void:
	var a = button.instantiate()

	self.position.x += 1
	print("Button Group Pos: ", button_group.position,global_position.x)
	spawn_grid_tile(a)

	global_position.x += 1
	print("Button Group Pos: ", button_group.position,global_position.x)
	spawn_grid_tile(a)

func spawn_grid_tile(Node):
	add_child(Node)
	print(get_children(),get_child_count())
	print(get_child(0))
	print(get_child(1))
	print(get_child(0).position)
	grid_row.append(str(Node))
	print(grid_row)
