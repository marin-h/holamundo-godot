# global
extends Node

signal perdi
signal gane

export var cuenta = 0
export var tiempo = 5

var current_scene = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	connect("gane", current_scene, "show_ganar", [], CONNECT_ONESHOT)
	connect("perdi", current_scene, "show_perder", [], CONNECT_ONESHOT)
	get_node("Timer").connect("timeout", current_scene, "decrementar_reloj", [], CONNECT_PERSIST)
	get_node("Timer").start()
	
func sumarUno():
	cuenta = cuenta + 1
	if(cuenta == 6):
		get_node("Timer").queue_free()
		emit_signal("gane")

func _on_Timer_timeout():
	tiempo = tiempo - 1
	if(tiempo > 0):
		get_node("Timer").start()
	else: 
		get_node("Timer").queue_free()
		emit_signal("perdi")