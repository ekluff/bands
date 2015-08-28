var main = function() {

  $('.edit-form').hide()

  $('.edit-button').click(function(){
    $('.edit-form').slideToggle(400);
  });

};

$(document).ready(main);
