extends Tree


func _on_Tree_item_selected():
	var item = get_selected()
	
	print(str(item.get_text(0)))
	print(str(item.is_checked(1)))
	print(str(item.get_text(2)))
	
	var id = int(item.get_text(0))
	update_selected(item, id)


func _ready():
	columns = 5
	hide_root = true
	
	var tree_root = create_item()
	tree_root.set_text(0, '0')
	tree_root.set_checked(1, 0)
	tree_root.set_text(2, 'ToDo')
	update_selected()


func add_item(parent:TreeItem, id, done, name, created, updated):
	var new_child = create_item(parent)
	
	print('adding item ', id, name, parent, new_child)
	if new_child:
		new_child.set_text(0, str(id))
		new_child.set_editable(0, false)
		
		new_child.set_checked(1, done)
		new_child.set_editable(1, true)
		new_child.set_cell_mode(1, 1)
		
		new_child.set_text(2, str(name))
		new_child.set_editable(2, true)
	
	return new_child


func update_selected(parent:TreeItem=null, parent_id=0):
	var data = Items.read(parent_id)
	
	print('updating ', parent, data)
	for D in data:
		var new_node = add_item(parent, D.id, D.done, D.name, D.created, D.updated)
