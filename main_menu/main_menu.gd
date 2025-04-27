extends Control

func _ready() -> void:
	var start_button = get_node("CenterContainer/VBoxContainer/start_button")
	start_button.grab_focus()

func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cutscenes/plane_cutscene.tscn")
