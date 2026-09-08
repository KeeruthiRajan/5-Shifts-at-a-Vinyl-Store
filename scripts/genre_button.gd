extends Area2D

var player_in_range = false

enum Genre {
	ROCK,
	JAZZ,
	POP,
	RAP,
	TRIBUTE
}

@export var genre: Genre


func set_sprite():
	$Sprite2D.region_enabled = true

	match genre:
		Genre.ROCK:
			$Sprite2D.region_rect = Rect2(128, 672, 16, 48)

		Genre.JAZZ:
			$Sprite2D.region_rect = Rect2(144, 672, 16, 48)

		Genre.POP:
			$Sprite2D.region_rect = Rect2(112, 672, 16, 48)
			
		Genre.RAP:
			$Sprite2D.region_rect = Rect2(96, 672, 16, 48)

		Genre.TRIBUTE:
			# Put the Tribute sprite coordinates here
			pass


func _ready() -> void:
	set_sprite()


func interact():
	match genre:
		Genre.ROCK:
			print("Never knew a clothing brand made music.")

		Genre.JAZZ:
			print("Chet Baker's kinda cool...")

		Genre.POP:
			print("Sabrina Carpenter's show worn heel!?")
			
		Genre.RAP:
			print("This 'Drake' guy must really suck, wdym 50 copies left?")

		Genre.TRIBUTE:
			print("King of Pop, Michael Jackson...")


func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		interact()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
