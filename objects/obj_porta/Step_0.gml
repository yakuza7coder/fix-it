if(distance_to_object(obj_prota) < 11) {
	
	if(keyboard_check_pressed(ord("E")))
	{	
		show_message("so testando")
		room_goto(Room2)
		show_message("imagine isso como dentro da empresa")
	} else if(obj_prota.iGotThis){
		obj_men.text = "Clique E para entrar ou R para usar a lupa"
		obj_men.tempo = 10
		if(keyboard_check(ord("R"))){
			show_message("voce usou a lupa")
			show_message("A lupa diz que isso é uma empresa")
		}
	} 

}
	