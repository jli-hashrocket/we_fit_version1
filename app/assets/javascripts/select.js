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
        term: term,
        page_limit: 10
      };
    },
    results: function(data, page){
      return { results: $.map( data, function(member, i) {
        return { id: member.id, text: member.username };
      } ) };
    }
  },
  // initSelection: function(element, callback) {
  //   var id = $(element).val();
  //     $.ajax("../to_json",{
  //       data: [{ id: id }],
  //       dataType: 'json',
  //     }).done(function(data) {
  //       callback(data.text[0])
  //     });
  // },
  formatResult: format,
  formatSelection: format

});
