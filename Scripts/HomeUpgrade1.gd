extends Sprite

var Upgrade1
var Upgrade2
var Upgrade3



func _ready():
	$CanvasLayer/Upgrade1/AnimationPlayer.animation_set_next("Chosen", "Fade out")
	pass

func time_delay():
		yield(get_tree().create_timer(2.0), "timeout")

func _on_Upgrade1_pressed():
		time_delay()
		$CanvasLayer/Upgrade1/AnimationPlayer.play("Chosen")
		$CanvasLayer/Upgrade2/AnimationPlayer2.play("Fadeout")
		$CanvasLayer/Upgrade3/AnimationPlayer3.play("Fadeout")
		$WoodlandsWall1/Wall1Animation.play("Wall1FadeOut") 
		$WoodlandsWall2/Wall2Animation.play("Wall2FadeIn")
		$CanvasLayer/Sprite/ChooseYourUpgrade/ChooseThumb.play("ChooseFadeOut")

func _on_AnimationPlayer_animation_finished():
	$WoodlandsWall1/Wall1Animation.play("Placed")
	$WoodlandsWall2/Wall2Animation.play("Placed")

func _on_Wall2Animation_animation_finished(anim_name):
		$CanvasLayer/ContinueButton/Continue.play("FadeIn")
		



func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/StoryModeGameplay.tscn")
