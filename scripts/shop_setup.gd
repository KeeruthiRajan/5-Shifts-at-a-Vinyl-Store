extends Node2D

var selection_menu_scene = preload("res://scenes/album_menu.tscn")

func open_menu(genre: String):
	var menu = selection_menu_scene.instantiate()
	add_child(menu)
	menu.load_data(genre)
