extends Node2D

enum colors {
	WHITE = 0,
	RED = 1,
	GREEN = 2,
	BLUE = 3
}

const COLOR_NAMES = {
	colors.WHITE: "White",
	colors.RED: "Red",
	colors.GREEN: "Green",
	colors.BLUE: "Blue"
}

export(colors) var color setget , get_color

func get_color():
	return color

func _on_Area2D_mouse_entered():
	print("Mouse entered cell with color: ", COLOR_NAMES[color])

func _on_Area2D_mouse_exited():
	print("Mouse exited cell with color: ", COLOR_NAMES[color])
