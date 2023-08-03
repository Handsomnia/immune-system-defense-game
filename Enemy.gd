extends PathFollow2D


func _physics_process(delta: float) -> void:
	set_offset(get_offset() + 144 * delta)
	if position == get_parent().curve.get_point_position(get_parent().curve.get_point_count() - 1):
#		print ("yes")
		call_deferred("queue_free")


func _on_Area2D_tree_entered() -> void:
	set_physics_process(true)
