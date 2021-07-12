extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.current_score > Global.high_score:
		Global.high_score = Global.current_score 
	$Menu/AppInformation/HighScoreText.text = ": " + str(Global.high_score)

func _process(_delta):
	for button in $"Menu/MainSection/Buttons/GameScenes".get_children():
			button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
func _on_Button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
