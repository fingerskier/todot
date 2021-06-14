extends Control

var tree_root:TreeItem

onready var Option := $MarginContainer/VBoxContainer/TodoTree
onready var MainTree := $MarginContainer/VBoxContainer/TodoTree


func _on_TodoCtrl_refresh():
	MainTree.update_selected()
