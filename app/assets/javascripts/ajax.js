$(function() {
  $("#favorites").on('click', 'a[data-favorite-user-id]', function(event){

    event.preventDefault();
    $button = $(event.target);
    $favoriteUserContainer = $('#' + $button.data('favorite-user-id'));

    $.ajax({
      type: 'DELETE',
      url: $button.attr('href'),
      dataType: 'json',
      success: $favoriteUserContainer.fadeOut()
    });
  });
});
