extends Node2D


var Default := Vector2(512,448)
var West : Vector2 = Vector2(16,448)


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


func _on_Area2D_area_entered(area):
	global.compass = 's'
	global.Levels = -1
	global.health = global.originalhealth
	get_tree().change_scene("res://Level1.tscn")
	pass # Replace with function body.


func _on_Area2D3_area_entered(area):
	get_tree().quit()
	pass # Replace with function body.


func _on_Area2D2_area_entered(area):
	get_tree().change_scene("res://Settings.tscn")
	pass # Replace with function body.
