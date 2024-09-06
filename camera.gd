extends Node3D

@onready var target = null

func _process(delta):
  if target:
    var tween = create_tween()
    tween.tween_property(self, "global_position", target.global_position, 0.1)
