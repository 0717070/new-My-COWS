extends Control

const WinScene = preload("res://WinScreen/WinScreen.tscn")
const LoseScene = preload("res://LoseScreen/LoseScreen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $HUD.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
		print(button)
		
func _on_Button_pressed(scene_to_load):
	print("Changing Scene...")
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)


func _on_ScoreTimer_timeout():
	Global.current_score +=1

func _process(delta):
	$score.text = "score: " + str(Global.current_score)


