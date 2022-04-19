extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label/Label.text = str(global.Reloadtime)
	$Label2/Label.text = str(global.Bulletspeed)
	$Label3/Label.text = str(global.Acceleration)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Menu_area_entered(area):
	global.compass = 'e'
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	global.Reloadtime +=0.05
	$Label/Label.text = str(global.Reloadtime)
	pass # Replace with function body.


func _on_Area2D2_area_entered(area):
	global.Reloadtime -=0.05
	$Label/Label.text = str(global.Reloadtime)
	pass # Replace with function body.


func _on_Area2D3_area_entered(area):
	global.Bulletspeed += 2
	$Label2/Label.text = str(global.Bulletspeed)
	pass # Replace with function body.


func _on_Area2D4_area_entered(area):
	global.Bulletspeed -= 2
	$Label2/Label.text = str(global.Bulletspeed)
	pass # Replace with function body.


func _on_Area2D5_area_entered(area):
	global.Acceleration += 20
	$Label3/Label.text = str(global.Acceleration)
	pass # Replace with function body.


func _on_Area2D6_area_entered(area):
	global.Acceleration -= 20
	$Label3/Label.text = str(global.Acceleration)
