$(document).on('turbolinks:load', function(){
  $('.js-selected-exam').change(function(){
    var examId = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/trainee/exams/' + examId,
      success: function(data){
        $('.js-exam-info').html(data);
      },
      error: function(xhr, textStatus, error){
        console.log(xhr.statusText);
        console.log(textStatus);
        console.log(error);
      }
    });
  });
});
