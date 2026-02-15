extends CanvasGroup

var grid_registry = []
@onready var button: Node2D = $"."

func _ready() -> void:
	## Need to read buttons
	#.instance.connect(button.button_ready)
	print(grid_registry)

func _on_child_entered_tree(node: Node) -> void:
	#if node.has_signal("button_ready"):
		grid_registry.append(node.get_children())
