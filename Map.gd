extends Node2D
var rngesus = RandomNumberGenerator.new()
var LevelArray := ["res://Level1.tscn","res://Level2.tscn","res://Level3.tscn","res://Level4.tscn","res://Level5.tscn"]
# Declare member variables here. Examples:
var North : Vector2 = Vector2(0,-280)
var East : Vector2 = Vector2(496,0)
var South : Vector2 = Vector2(0,280)
var West : Vector2 = Vector2(-496,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	global.Levels +=1
	$Camera2D/UI/Label2.text = str(global.Levels)
	if global.compass == 's':
		$Player.position = North
	if global.compass == 'n':
		$Player.position = South
	if global.compass == 'w':
		$Player.position = East
	if global.compass == 'e':
		$Player.position = West

	$Camera2D/UI/TextureProgress.max_value = $Player/Timer.wait_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(global.health < 6):
		$Camera2D/UI/Sprite6.visible = false
	else:
		$Camera2D/UI/Sprite6.visible = true
	if(global.health < 5):
		$Camera2D/UI/Sprite5.visible = false
	else:
		$Camera2D/UI/Sprite5.visible = true
	if(global.health < 4):
		$Camera2D/UI/Sprite4.visible = false
	else:
		$Camera2D/UI/Sprite4.visible = true
	if(global.health < 3):
		$Camera2D/UI/Sprite3.visible = false
	else:
		$Camera2D/UI/Sprite3.visible = true
	if(global.health < 2):
		$Camera2D/UI/Sprite2.visible = false
	else:
		$Camera2D/UI/Sprite2.visible = true
	if(global.health < 1):
		$Camera2D/UI/Sprite.visible = false
	else:
		$Camera2D/UI/Sprite.visible = true

	if(global.enemycount == 0):
		$TileMap.set_cell(-1,-8,-1)
		$TileMap.set_cell(0,-8,-1)
		$TileMap.set_cell(-15,0,-1)
		$TileMap.set_cell(-15,-1,-1)
		$TileMap.set_cell(-1,7,-1)
		$TileMap.set_cell(0,7,-1)
		$TileMap.set_cell(13,0,-1)
		$TileMap.set_cell(13,-1,-1)
	print($Player/Timer.time_left)
	$Camera2D/UI/TextureProgress.value = $Player/Timer.time_left


func _on_Area2D_body_entered(body):
	$TileMap.set_cell(-1,-8,0)
	$TileMap.set_cell(0,-8,0)
	$TileMap.set_cell(-15,0,0)
	$TileMap.set_cell(-15,-1,0)
	$TileMap.set_cell(-1,7,0)
	$TileMap.set_cell(0,7,0)
	$TileMap.set_cell(13,0,0)
	$TileMap.set_cell(13,-1,0)
	
	
	pass # Replace with function body.




func _on_WestCheck_area_entered(area):
	global.compass = 'w'
	rngesus.randomize()
	get_tree().change_scene(LevelArray[rngesus.randi_range(0,4)])
	print("brooooooooooooooooooooooooooooooooken")


func _on_EastCheck_area_entered(area):
	global.compass = 'e'
	rngesus.randomize()
	get_tree().change_scene(LevelArray[rngesus.randi_range(0,4)])
	print("east")

func _on_NorthCheck_area_entered(area):
	global.compass = 'n'
	rngesus.randomize()
	get_tree().change_scene(LevelArray[rngesus.randi_range(0,4)])
	print("north")

func _on_SouthCheck_area_entered(area):
	global.compass = 's'
	rngesus.randomize()
	get_tree().change_scene(LevelArray[rngesus.randi_range(0,4)])
	print("south")
