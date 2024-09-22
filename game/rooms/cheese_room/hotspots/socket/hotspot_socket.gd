@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.


#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you can make the player character walk to this hotspot, gaze at it, and then say
	# something:
#	await C.player.walk_to_clicked()
#	await C.player.face_clicked()
#	await C.player.say("What a nice view")


func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you could make the player instantly goto another room on an exit hotspot instead
	# of waiting for the player to walk there.
#	await R.current = R.NewRoom


# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you can make the player character gaze at this hotspot and then say something:
#	await C.player.face_clicked()
#	await C.player.say("A window")


# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() to implement your code.
	#E.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# hotspot. Note that you have to change the name of the `_item` parameter to `item`.
	if _item == I.Battery and E.charged_battery:
		await C.player.walk_to_clicked()
		await C.player.face_left()
		await C.player.say("Wonder what this does…")
		I.Battery.remove()
		R.get_prop("Battery").visible = true
		E.scraps_dead = true
		# shock SFX
		E.am.play_sound_cue("electrocute")
		await C.Scraps.play_animation("shock")
		E.am.play_sound_cue("thump")
		await C.Scraps.play_animation("dead")
		await C.Scraps.pause_animation()
		await E.wait(2.0)
		await E.queue([
			await C.player.queue_say("Oh whoops…"),
			await C.player.queue_say("Sorry…"),
			await C.player.queue_say("…Are you okay?"),
			await E.queue_wait(2.0),
			await C.player.queue_say("Must’ve ate so much cheese he needed a nap."),
			await C.player.queue_say("I wonder if he’d be useful somehow…"),
		])


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
