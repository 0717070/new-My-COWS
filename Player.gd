extends KinematicBody2D

var bullet = preload("res://Bullet/Bullet.tscn")

export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)
	$Area2D.connect("area_entered", self, "_colliding")
	$Area2D.connect("area_exited", self, "_not_colliding")

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed * delta, 0))
		$SoundStep.play(0.0)
	if Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed * delta, 0))
		$SoundStep.play(0.0)

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		if Global.bulletInstantCount < 2: # amount of bullets able to be shot at a time = 2
			var bulletInstance = bullet.instance()
			bulletInstance.position = Vector2(position.x, position.y -100)
			get_tree().get_root().add_child(bulletInstance)
			

func _colliding(area): # code for bouncing off borders
	if area.is_in_group("left"):
		position. x=80
		print("left")
	if area.is_in_group("right"):
		position. x=1190
		print("right")


func _not_colliding(area):
	pass


