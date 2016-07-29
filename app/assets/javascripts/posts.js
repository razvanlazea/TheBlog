function login(user, pass){

	var valid = "<%= valid_user_and_pass(#{user}, #{pass})%>"	
	if(valid){
		
		document.getElementById("password").style.display = "none"	
	}
	else{
		document.getElementById("username").style.display = "none"
	}
}
