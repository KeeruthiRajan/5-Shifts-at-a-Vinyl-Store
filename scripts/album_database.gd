extends Control
var dispdata = [] # haven't named this albums cuz what if i add mixtapes or sum shi
@onready var gentitle: Label = $MenuPanel/MarginContainer/MainVBox/CategoryTitle
@onready var albname: Label = $MenuPanel/MarginContainer/MainVBox/InfoArea/Name
@onready var albartist: Label = $MenuPanel/MarginContainer/MainVBox/InfoArea/Artist
@onready var albmd: Label = $MenuPanel/MarginContainer/MainVBox/InfoArea/Metadata
@onready var art_work: TextureRect = $MenuPanel/MarginContainer/MainVBox/SelectionArea/ArtWork

var lcount = 0

func load_data(genre: String):
	var file = FileAccess.open("res://data/albums.json", FileAccess.READ)
	var tjson = file.get_as_text()
	var data = JSON.parse_string(tjson)
	dispdata = data["albums"][genre]
	gentitle.text = genre
	albname.text = dispdata[lcount]["title"]
	albartist.text = dispdata[lcount]["artist"]
	albmd.text = " • ".join(dispdata[lcount]["genres"]) 
	art_work.texture = load(dispdata[lcount]["cover"])

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_next_button_pressed() -> void:
	lcount += 1
	lcount %= len(dispdata)
	albname.text = dispdata[lcount]["title"]
	albartist.text = dispdata[lcount]["artist"]
	albmd.text = " • ".join(dispdata[lcount]["genres"]) 
	art_work.texture = load(dispdata[lcount]["cover"])

func _on_prev_button_pressed() -> void:
	lcount += len(dispdata) - 1
	lcount %= len(dispdata)
	albname.text = dispdata[lcount]["title"]
	albartist.text = dispdata[lcount]["artist"]
	albmd.text = " • ".join(dispdata[lcount]["genres"]) 
	art_work.texture = load(dispdata[lcount]["cover"])
