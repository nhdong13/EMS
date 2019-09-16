$(document).on('turbolinks:load', function(){
  $(document).on('click', '.js-as-mark', function(){
    var asId = $(this)[0].getAttribute('answersheet');
      $.ajax({
        type: 'PUT',
        url: '/trainee/trainee_answer_sheets/' + asId,
        data: {
          'answersheet': asId
        },
        success: function(data){
          $('#menu1').html(data);
        },
        error: function(xhr, textStatus, error){
          console.log(xhr.statusText);
          console.log(textStatus);
          console.log(error);
        }
      });
  });
});