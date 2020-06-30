// $(document).on('turbolinks:load', function(){
  $(document).on('click', '.js-qs-add', function(){
    var questionId = $(this)[0].getAttribute('question_id');
    var examId = $(this)[0].getAttribute('exam_id');
    var markIdName = '#mark-'+ questionId;
    var mark = $(markIdName).val();
    if (mark > 0){
      $.ajax({
        type: 'POST',
        url: '/exam_has_questions',
        data: {
          'question_id': questionId,
          'exam_id': examId,
          'mark': mark
        },
        success: function(data){
          $('#questionTbl').html(data);
        },
        error: function(xhr, textStatus, error){
          console.log(xhr.statusText);
          console.log(textStatus);
          console.log(error);
        }
      });
    }
  });

  $(document).on('click', '.js-qs-cancel', function(){
    var questionId = $(this)[0].getAttribute('question_id');
    var examId = $(this)[0].getAttribute('exam_id');
    $.ajax({
      type: 'DELETE',
      url: '/exam_has_questions/' + questionId,
      data: {
        'question_id': questionId,
        'exam_id': examId,
      },
      success: function(data){
        $('#questionTbl').html(data);
      },
      error: function(xhr, textStatus, error){
        console.log(xhr.statusText);
        console.log(textStatus);
        console.log(error);
      }
    });
  });
// });
