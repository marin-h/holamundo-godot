# global
extends Node
export var cuenta = 0

func _ready():
	pass

func sumarUno():
	cuenta = cuenta + 1
	print(cuenta)