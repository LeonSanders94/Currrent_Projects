extends CanvasGroup

var grid_registry = []
@onready var button: Node2D = $"."




func _ready() -> void:
	print("Grid Registry: ",grid_registry)


func _on_child_entered_tree(node: Node) -> void:
	#if node.has_signal("button_ready"):
	var tile_id = "Tile: "
	tile_id += (str(node).substr(25,-1))
	grid_registry.append(tile_id)

func _button_press():
	
	print("pressed! on grid!")
