@tool
extends PopochiuRoom

const Data := preload('room_end_state.gd')

var state: Data = load("res://game/rooms/end/room_end.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	#C.player.visible = false
	E.gui.visible = false
	G.gui.hide()
	G.gui.queue_free()
	#pass


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	pass

# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
