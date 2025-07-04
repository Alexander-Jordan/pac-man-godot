class_name Pacdot extends Spawnable2D

@export var points: int = 10

@onready var collectable_2d: Collectable2D = $Collectable2D

func _ready() -> void:
	collectable_2d.collected.connect(on_collected)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('dev_dots_collect'):
		on_collected()

func on_collected() -> void:
	GM.dots_collected += 1
	SS.stats.score += points
	despawn()
