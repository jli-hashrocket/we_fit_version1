
  var add_favorite = function(user_id, favorited_id ){
        alert('!');

    $.ajax({
      type: "POST",
      dataType: 'json',
      url: "/users/"+favorited_by_id+"/favorites",
      data: displayMember
    })
    add_favorite(user_id, favorited_id);
  };

  var displayMember = function(favorite){
    $('#favorites').html("<p>" + favorite.username + "</p>");
  };

  add_favorite(user_id,favorited_id);

