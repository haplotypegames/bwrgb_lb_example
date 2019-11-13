extends Node2D

const TILE_OBJECT_SCENES = {
#Path to the correspond scene to instance
#The key must be the same as the key in the 'tile_naming' dictionary
	0: "res://Objects/White/White.tscn",
	1: "res://Objects/Red/Red.tscn",
	2: "res://Objects/Green/Green.tscn",
	3: "res://Objects/Blue/Blue.tscn"
}

const LEVEL_SCENE_PATH = "res://Levels/level.gd"

export(PackedScene) var tilemap_scene = null
export(String) var level_name = ""
export(String) var output_path = "res://Levels/Game_Levels/"

var map: Node2D = null
var tile_size: Vector2 = Vector2.ZERO
var tilemap: TileMap  = null

var tile_naming = { 
#How you want the scenes to be named in the level
#The key must be the same as the key in the 'TILE_OBJECT_SCENES' dictionary
	0: ["White", 0],
	1: ["Red", 0],
	2: ["Green", 0],
	3: ["Blue", 0]
}

func _ready():
	assert(tilemap_scene != null and level_name != "")
	map = load(LEVEL_SCENE_PATH).new()
	map.name = level_name
	tilemap = tilemap_scene.instance()
	tile_size = tilemap.cell_size
	build_map()
	save_the_level(map)
	
func build_map():
	var cells: Array = tilemap.get_used_cells()
	for i in range(cells.size()):
		var map_object = load(TILE_OBJECT_SCENES[tilemap.get_cellv(cells[i])]).instance()
		map.add_child(map_object)
		map_object.name = name_cell(tilemap.get_cellv(cells[i]))
		map_object.position = determine_object_pos_in_map(cells[i])
		map_object.owner = map

func name_cell(tile: int) -> String:
	var the_name: String = ""
	the_name = tile_naming[tile][0] + "_" + str(tile_naming[tile][1])
	tile_naming[tile][1] += 1
	return the_name

func determine_object_pos_in_map(coord: Vector2) -> Vector2:
	var pos: Vector2 = Vector2.ZERO
	pos.x = (coord.x * tile_size.x) + tile_size.x * 0.5
	pos.y = (coord.y * tile_size.y) + tile_size.y * 0.5
	return pos

func save_the_level(the_level:Node2D) -> int:
	var level_scene = PackedScene.new()
	var result = level_scene.pack(the_level)
	if result == OK:
		ResourceSaver.save(output_path + level_name + ".tscn", level_scene)
		print_debug("Level saved successfully.")
	else:
		result = FAILED
		print_debug("There was a problem saving the level.")
	return result
