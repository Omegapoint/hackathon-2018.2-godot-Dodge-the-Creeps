extends CanvasLayer

signal start_game

func show_message(text):
    $MessageLabel.text = text
    $MessageLabel.show()
    $MessageTimer.start()

func show_game_over(highscore_list):
    $MessageLabel.text = ""
    var highscore_size = 3
    if highscore_list.size() < 3: 
        highscore_size = highscore_list.size()
    for i in highscore_size:
        $MessageLabel.text += highscore_list[i][1] + " - " + str(highscore_list[i][0]) + "\n"
    $StartButton.show()
    $NameInput.show()
    $MessageLabel.show()

func update_score(score):
    $ScoreLabel.text = str(score)	
    
func _on_MessageTimer_timeout():
    $MessageLabel.hide()


func _on_StartButton_pressed():
    $StartButton.hide() 
    $NameInput.hide()
    emit_signal("start_game")
