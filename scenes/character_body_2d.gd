extends CharacterBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const SPEED = 150.0
var last_dir = Vector2.DOWN

func get_input(_delta):
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = SPEED * dir
	return dir

func play_anim(nm):
	if animation_player.current_animation != nm:
		animation_player.play(nm)

func animation(dir):
	if dir != Vector2.ZERO:
		last_dir = dir
		
		if abs(dir.x) > abs(dir.y):
			if dir.x > 0:
				play_anim("run_right")
			else:
				play_anim("run_left")
		else:
			if dir.y > 0:
				play_anim("run_down")
			else:
				play_anim("run_up")
	else:
		if abs(last_dir.x) > abs(last_dir.y):
			if last_dir.x > 0:
				play_anim("idle_right")
			else:
				play_anim("idle_left")
		else:
			if last_dir.y > 0:
				play_anim("idle_down")
			else:
				play_anim("idle_up")

func _physics_process(delta: float) -> void:
	var anim = get_input(delta)
	animation(anim)
	move_and_slide()
