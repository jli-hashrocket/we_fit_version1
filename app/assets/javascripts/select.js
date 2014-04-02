var format = function(member){
  return member.text;
};

$("#message_recipient_id").select2({
  placeholder: "Search for a member",
  minimumInputLength: 2,
  ajax: {
    url: "../to_json",
    dataType: 'json',
    data: function (term, page) {
      return {
        q: term,
        page_limit: 10
      };
    },
    results: function(data, page){
      return { results: $.map( data, function(member) {
        return { id: member.id, text: member.username };
      } ) };
    }
  }

});
