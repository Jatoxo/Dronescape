extends Node2D


var Default := Vector2(512,448)
var West : Vector2 = Vector2(16,448)

export(PackedScene) var startingLevel


# Called when the node enters the scene tree for the first time.
func _ready():
	if global.compass == 'e':
		$Player.position = West
	else:
		$Player.position = Default
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(_area):
	global.compass = 's'
	global.Levels = -1
	global.health = global.originalhealth
	var _err = get_tree().change_scene_to(startingLevel)


func _on_Area2D3_area_entered(_area):
	get_tree().quit()


func _on_Area2D2_area_entered(_area):
	var _err = get_tree().change_scene("res://Scenes/Settings.tscn")
