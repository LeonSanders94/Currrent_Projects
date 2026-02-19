extends Button

##Variable Zone##

@onready var player_object: Control = %Player_Object
var item_held_in_button = player_object.item_library[1]

####

##Picking up item and storing it on the Player_Object node##
func _on_pressed() -> void:
	## Player Holding an Item already and There is an item in the button ##
	if player_object.held_object != "" and item_held_in_button != "" and player_object.has_item == true:
		print("Already Holding ", player_object.held_object)
		
	## No item Present in the button ##
	elif item_held_in_button == "":
		print("No item in this button")
	
	## Picking up an item ##
	else:
		print("Picked up ", item_held_in_button)
		player_object.held_object = item_held_in_button
		item_held_in_button = ""
		player_object.has_item = true
	####
