var main = function() {

  $('.edit-form').hide()

  $('.edit-button').click(function(){
    $('.edit-form').toggle(400);
  });

};

$(document).ready(main);
