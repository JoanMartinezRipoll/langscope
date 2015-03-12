$(document).ready(function(){
  $("form").on('click', '.remove_fields', function() {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    event.preventDefault();
  });
  $("form .add_fields").click(function(event){
    regexp = new RegExp($(this).data('id'), 'g');
    fieldSetNum = $("fieldset").length + 1;
    $(this).before($(this).data('fields').replace(regexp, fieldSetNum));
    event.preventDefault();
  });
});


