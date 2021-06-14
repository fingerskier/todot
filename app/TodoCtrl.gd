extends OptionButton

signal refresh


func _on_TodoCtrl_item_selected(index):
	var thisn = get_child(index)
	var txt = get_item_text(index)
	print(txt)
	run_command(index)
	select(0)


func run_command(index:int):
	var selected_cmd = get_child((index))
	
	if index == 0:
		pass
	elif index == 1:
		# Add Sibling
		var parent_id = selected_cmd.parent_id if selected_cmd else 0
		Items.add('ToDo', parent_id)
	elif index == 2:
		# Add Child
		var parent_id = selected_cmd.id
	elif index == 7:
		# Refresh List
		var parent_id = selected_cmd.id if selected_cmd else 0
		emit_signal('refresh', parent_id)
