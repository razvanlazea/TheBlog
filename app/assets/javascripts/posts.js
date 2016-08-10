counter = 0;
$(document).ready(function(){

	var ceva = function(){
		console.log("se aplica events");
		function addImage(divName){
			var existingInput = $('#'+divName).find('input:first-child');
			$('#'+divName).append(existingInput.clone().attr("name", "post[image][img" + counter + "]"));
			counter += 1;
		}



		$('#addAComment').on('click', function(){
			$('.newComment').slideDown('fast');
		});
		$('#addAComment').on('mouseenter', function(){
			$(this).addClass('commentMouse');
			$(this).animate({'top': '-5px'}, 'fast');
		});
		$('#addAComment').on('mouseleave', function(){
			$(this).removeClass('commentMouse');
			$(this).animate({'top': '0px'}, 'fast');
		});

		$('.indexArticle').on('mouseenter', function(){
			$(this).animate({'top': '-5px', 'left': '-5px'}, 'fast');
		});
		
		$('.indexArticle').on('mouseleave', function(){
			$(this).animate({'top': '0px', 'left': '0px'}, 'fast');
		});
		$('.regInput').on('input', function(){
			if($(this).next().prop("tagName") != 'B'){
				if($(this).val().length < 6){
					$(this).after("<b style='color: red'>Must be at least 6 characters long</b>");
				}
				else{
					$(this).after("<b style='color: green'>Good</b>");
				}
			}
			else{
				if($(this).val().length > 5){
					$(this).next().remove();
					$(this).after("<b style='color: green'>Good</b>");
				}
				else{
					$(this).next().remove();
					$(this).after("<b style='color: red'>Must be at least 6 characters long</b>")
				}
			}
		});

		$('.confirm').on('input', function(){
			
			if($(this).next().prop("tagName") != 'B'){
				if($(this).prevAll('.regInput:first').val() != $(this).val()){
					$(this).after("<b style='color: red'>Passwords don't match</b>");
				}
				else{
					$(this).after("<b style='color: green'>Good</b>");
				}
			}
			else{
				if($(this).prevAll('.regInput:first').val() == $(this).val()){
					$(this).next().remove();
					$(this).after("<b style='color: green'>Good</b>");
				}
				else{
					$(this).next().remove();
					$(this).after("<b style='color: red'>Passwords don't match</b>")
				}
			}
		})

		$('#deleteCom').bind('ajax:success', function(){
			$(this).fadeOut();
		})

		$('#newUser').submit(function(e){
			e.preventDefault();
			if($('.regInput').val().length < 6 || $('.regInput').val() != $('.confirm').val()){
				return false
			}
			else{
				return true
			}
		})
	};

	// $(document).ready(ceva);
	$(document).on('turbolinks:load', ceva);

});


$(document).on('turbolinks:load', function(){
	console.log('page load triggered');
});