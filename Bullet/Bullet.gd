extends KinematicBody2D

var speed = 500
const WinScene = preload("res://WinScreen/WinScreen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.bulletInstantCount += 1
	
	set_physics_process(true)

func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, -speed * delta))
	if (collidedObject):
		
		# if collidedObject.is_in_group("enemy"):
		
		if "Enemy" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
		queue_free()
		# code above is used to get rid of alienship once collided with bullet
		Global.bulletInstantCount -= 1
		print(Global.bulletInstantCount)
		
		Global.enemy_number = Global.enemy_number - 1
		print(Global.enemy_number)
		if Global.enemy_number == 0:
			#LoseScene.Instance() 
			var game_over_win = WinScene.instance()
			get_tree().get_root().add_child(game_over_win)
		
