$(document).ready(function(){
	$("form .remove_fields").click(function(event){
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('fieldset').hide()
		event.preventDefault()
	});
	$("form .add_fields").click(function(event){
		time = new Date().getTime()
		// g means global match
		regexp = new RegExp($(this).data('id'), 'g')
		//this line puts all the data before the link and replaces the ruby ids with time ids
		$(this).before($(this).data('fields').replace(regexp, time))
		event.preventDefault()
	});
});


