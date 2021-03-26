extends Node

func _ready():
	set_camera_limits()
		
func set_camera_limits():
	var map_limits = get_node("Navigation2D/TileMap_Background").get_used_rect()
	var map_cellsize = get_node("Navigation2D/TileMap_Background").cell_size
	$David/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$David/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$David/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$David/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
