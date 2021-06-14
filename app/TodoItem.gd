extends GridContainer

export var id = 0
export var what = 'What to do'
export var done = false
export var created = '2021-06-12 17:18:54'
export var updated = '2021-06-12 17:18:54'

onready var Created:LineEdit = $Created
onready var Done:CheckBox = $Done
onready var ID:LineEdit = $ID
onready var Template = load('res://TodoItem.tscn')
onready var Updated:LineEdit = $Updated
onready var What:LineEdit = $What


func _init(_id, _what='to-do', _done=false, _created='', _updated=''):
	id = _id
	what = _what
	done = _done
	created = _created
	updated = _updated


func _ready():
	ID.text = str(id)
	What.text = what
	Done.pressed = done
	Created.text = created
	Updated.text = updated


func save():
	Items.update(id, what, done)
