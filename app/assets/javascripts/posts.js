function login(user, pass){

	var valid = "<%= valid_user_and_pass(#{user}, #{pass})%>"	
	if(valid){
		
		document.getElementById("password").style.display = "none"	
	}
	else{
		document.getElementById("username").style.display = "none"
	}
}
counter = 0;
function addImage(divName){
	var existingInput = $('#'+divName).find('input:first-child');
	$('#'+divName).append(existingInput.clone().attr("name", "post[image][img" + counter + "]"));
	counter += 1;
	// var newDiv = document.createElement('div');
	// newDiv.id = "im";
	// newDiv.innerHTML = <%= i.file_field :img %>;
	// document.getElementById(divName).appendChild(newDiv);
}

function addComment(divName){
	var existingInput = $('#'+divName).find('input:first-child');
	$('#'+divName).append(existingInput.clone());
}
