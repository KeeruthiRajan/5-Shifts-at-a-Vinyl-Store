extends CanvasModulate

# Called when the node enters the scene tree for the first time.
var hex = [
	#Color("#0B0C1A"),
	#Color("#16213E"),
	#Color("#2C3E66"),
	Color("#FFD27A"),
	Color("#FFFFFF"),
	Color("#FF944D"),
]

var time = 0
var speed = 0.2

func _ready() -> void:
	color = hex[time]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta * speed
	var t = fmod(time, hex.size()) # Modulo function to cycle through array
	var i = [int(t), (int(t) + 1) % hex.size()] # Index of current and next color
	var blend = t - i[0] # Blending percentage
	color = hex[i[0]].lerp(hex[i[1]], blend) # lerp() -> Interpolation function
