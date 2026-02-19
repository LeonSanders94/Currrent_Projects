extends Button

## Variable Zone ##
@onready var player_object: Control = %Player_Object
var item_in_place:String
####

## Pressed button places item, if there is one in the GArea button
func _on_pressed() -> void:
	if player_object.held_object != "":
		item_in_place = player_object.held_object
		print("I now own: ",item_in_place)
		self.text = item_in_place
		player_object.held_object = ""
		player_object.has_item = false
		if player_object.held_object == "":
			print("player_object cleared")
	else:
		print("You need to be holding an item")
