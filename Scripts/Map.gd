extends Node2D
var rngesus = RandomNumberGenerator.new()

export(Array, String) var LevelArray := [
	"res://Scenes/Levels/Level1.tscn",
	"res://Scenes/Levels/Level2.tscn",
	"res://Scenes/Levels/Level3.tscn",
	"res://Scenes/Levels/Level4.tscn",
	"res://Scenes/Levels/Level5.tscn"]


var spawnPos = {
	"s" : Vector2(0,-280),
	"w" : Vector2(496,0),
	"n" : Vector2(0,280),
	"e" : Vector2(-496,0)
}

# Called when the node enters the scene tree for the first time.
func _ready():
	global.enemycount = get_tree().get_nodes_in_group("Enemy").size()
	global.Levels +=1
	$Camera2D/UI/Label2.text = str(global.Levels)
	$Player.position = spawnPos[global.compass]
	
	$Camera2D/UI/TextureProgress.max_value = $Player/Timer.wait_time
	
	update_health()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(global.enemycount == 0):
		$TileMap.set_cell(-1,-8,-1)
		$TileMap.set_cell(0,-8,-1)
		$TileMap.set_cell(-15,0,-1)
		$TileMap.set_cell(-15,-1,-1)
		$TileMap.set_cell(-1,7,-1)
		$TileMap.set_cell(0,7,-1)
		$TileMap.set_cell(13,0,-1)
		$TileMap.set_cell(13,-1,-1)
	#print($Player/Timer.time_left)
	$Camera2D/UI/TextureProgress.value = $Player/Timer.time_left


func _on_Area2D_body_entered(_body):
	$TileMap.set_cell(-1,-8,0)
	$TileMap.set_cell(0,-8,0)
	$TileMap.set_cell(-15,0,0)
	$TileMap.set_cell(-15,-1,0)
	$TileMap.set_cell(-1,7,0)
	$TileMap.set_cell(0,7,0)
	$TileMap.set_cell(13,0,0)
	$TileMap.set_cell(13,-1,0)
	


func _on_WestCheck_area_entered(_area):
	global.compass = 'w'
	rngesus.randomize()
	var _err = get_tree().change_scene(LevelArray[rngesus.randi_range(0,4)])
	print("brooooooooooooooooooooooooooooooooken")


func _on_EastCheck_area_entered(_area):
	global.compass = 'e'
	rngesus.randomize()
	var _err = get_tree().change_scene(LevelArray[rngesus.randi_range(0,4)])
	print("east")

func _on_NorthCheck_area_entered(_area):
	global.compass = 'n'
	rngesus.randomize()
	var _err = get_tree().change_scene(LevelArray[rngesus.randi_range(0,4)])
	print("north")

func _on_SouthCheck_area_entered(_area):
	global.compass = 's'
	rngesus.randomize()
	var _err = get_tree().change_scene(LevelArray[rngesus.randi_range(0,4)])
	print("south")


func _on_Player_damage_taken() -> void:
	update_health()


func update_health():
	$Camera2D/UI/Sprite6.visible = global.health > 5
	$Camera2D/UI/Sprite5.visible = global.health > 4
	$Camera2D/UI/Sprite4.visible = global.health > 3
	$Camera2D/UI/Sprite3.visible = global.health > 3
	$Camera2D/UI/Sprite2.visible = global.health > 1
	$Camera2D/UI/Sprite.visible = global.health > 0
	
