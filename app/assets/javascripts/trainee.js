// $(document).on('turbolinks:load', function(){
  $(document).on('click', '.js-tr1-btn', function(){
    var traineeId = $(this)[0].getAttribute('trainee_id');
    $.ajax({
      type: 'POST',
      url: '/user_has_subjects',
      data: {
        'user_id': traineeId
      },
      success: function(data){
        $('#menu3').html(data);
      },
      error: function(xhr, textStatus, error){
        $('#menu3').html(error);
      }
    });
  });

  $(document).on('click', '.js-tr2-btn', function(){
    var traineeId = $(this)[0].getAttribute('trainee_id');
    $.ajax({
      type: 'DELETE',
      url: '/user_has_subjects/' + traineeId,
      data: {
        'user_id': traineeId
      },
      success: function(data){
        $('#menu3').html(data);
      },
      error: function(xhr, textStatus, error){
        $('#menu3').html(error);
      }
    });
  });
// });
