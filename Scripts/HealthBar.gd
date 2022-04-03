extends CanvasLayer

var counter = 4 

func _process(_delta):
	if Global.health == 4 and counter == 4:
		counter -= 1
		$Heart5/AnimationPlayer5.play("Heart 5")
	if Global.health == 3 and counter == 3:
		counter -= 1
		$Heart4/AnimationPlayer4.play("Heart 4")
	if Global.health == 2 and counter == 2:
		counter -= 1
		$Heart3/AnimationPlayer3.play("Heart 3")
	if Global.health == 1 and counter == 1:
		counter -= 1
		$Heart2/AnimationPlayer2.play("Heart 2")
	if Global.health == 0 and counter == 0:
		counter -= 1
		$Heart1/AnimationPlayer1.play("Heart 1")
		




func _on_AnimationPlayer1_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/GameOverScene.tscn")
