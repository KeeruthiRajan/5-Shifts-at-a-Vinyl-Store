extends Control
@onready var rich_text_label: RichTextLabel = $TextBox

var dialogues = [
	"I don’t want something [b]happy[/b].",
	"I want something that understands being tired.",
	"Something warm... but heavy.",
	"You recommended [b][i]In Rainbows[/i][/b]"
]

var current_line = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rich_text_label.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_button_pressed() -> void:
	if current_line == 3:
		current_line = -1
	current_line += 1
	if current_line > 2:
		current_line %= 3
	rich_text_label.text = dialogues[current_line]
	
func _on_recommend_pressed() -> void:
	current_line = 3
	rich_text_label.text = dialogues[current_line]
