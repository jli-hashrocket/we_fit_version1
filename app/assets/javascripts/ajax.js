$("[data-favorite-user-id]").on('click', function(event){
  event.preventDefault();
  $button = $(event.target);
  $favoriteUserContainer = $('#' + $button.data('favorite-user-id'));
  $.ajax({
    type: 'DELETE',
    url: $button.attr('href'),
    success: $favoriteUserContainer.fadeOut()
  });

});
