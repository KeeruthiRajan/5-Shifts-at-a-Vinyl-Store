extends Area2D
@export var shop_setup: Node
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
			shop_setup.open_menu("rock")

		Genre.JAZZ:
			shop_setup.open_menu("jazz")

		Genre.POP:
			shop_setup.open_menu("pop")
			
		Genre.RAP:
			shop_setup.open_menu("rap")

		Genre.TRIBUTE:
			print("Fly high, King of Pop...")


func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		interact()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true
		# print("Player in.")


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		# print("Player out.")
