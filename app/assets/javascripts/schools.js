$(document).ready(function(){
  $("form").on('click', '.remove_fields', function() {
    //This code line below sets _destory to true
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    event.preventDefault();
  });
  $("form").on('click', '.add_fields', function() {
    regexp = new RegExp($(this).data('id'), 'g');
    fieldSetNum = $("fieldset").length + 1;
    $(this).before($(this).data('fields').replace(regexp, fieldSetNum));
    event.preventDefault();
  });
});


