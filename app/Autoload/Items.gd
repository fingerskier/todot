extends Node

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")

var db:SQLite
var db_name := "user://database.db"
var table_name = 'todo'


func _ready():
	db = SQLite.new()
	db.path = db_name
	db.verbose_mode = true
	db.open_db()
	
	db.query("""
		CREATE TABLE IF NOT EXISTS todo (
			id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
			parent_id INTEGER NOT NULL DEFAULT 0,
			name TEXT NOT NULL DEFAULT 'new item',
			done INTEGER NOT NULL DEFAULT 0,
			created NOT NULL DEFAULT CURRENT_TIMESTAMP,
			updated NOT NULL DEFAULT CURRENT_TIMESTAMP
		)
	""")


func add(name="new item", parent_id=0):
	var dat = {
		"parent_id": parent_id,
		"name": name,
	}
	db.insert_row(table_name, dat)
	
	var new_id = db.last_insert_rowid
	print('added @ %s' % new_id)
	return new_id


func commitFake():
	var dict:Dictionary = {}
	
	dict["name"] = "a new thing to do"
	
	db.insert_row(table_name, dict)
	print('new todo item added: %s %s' % [table_name, str(dict)])
	
	if db.error_message:
		print(db.error_message)
	
	db.query('SELECT * FROM %s' % table_name)
	print(str(db.query_result))


func complete(id):
	# Mark an item as done
	pass


func delete(id):
	pass


func insert(rows=[]):
	db.insert_rows(table_name, rows)


func read(parent_id:int=0):
	db.query('SELECT * FROM %s WHERE parent_id = %s' % [table_name, parent_id])
	var result = db.query_result
	return result


func update(id:int, what, done):
	pass
