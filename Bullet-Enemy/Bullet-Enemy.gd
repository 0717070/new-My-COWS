extends KinematicBody2D

var speed = 300

const LoseScene = preload("res://LoseScreen/LoseScreen.tscn")
#const MainGame = preload("res://MainGame.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.enemyBulletInstanceCount += 1
	set_physics_process(true)

func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, +speed*delta*0.4))
	if (collidedObject):
		if "enemy" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
			pass 
			#collidedObject.get_collider().queue_free() #Don't kill the enemies.
		else:
			queue_free()
			
	if (collidedObject):
		#when enemy bullet hits cow, cow dies
		if "cow" in collidedObject.collider.name:
				collidedObject.get_collider().queue_free()
				queue_free()
				print("cows")
				Global.cow_number = Global.cow_number - 1
				print(Global.cow_number)
		Global.enemyBulletInstanceCount -= 1
		if Global.cow_number == 0:
			#LoseScene.Instance() 
	
			var game_over = LoseScene.instance()
			get_tree().get_root().add_child(game_over)
			
		print("Enemy Bullets: ", Global.enemyBulletInstanceCount)
