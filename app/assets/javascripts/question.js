$(document).on('turbolinks:load', function(){
  $('.js-add-answer-btn').click(function(){
    var htmlCode = '';
    var answerCounter = String.fromCharCode($('.picked-answer').length + 97);
    if ($('#type_of_question').val() == 0){
      htmlCode = '<div class="row answer-row"><div class="col-xs-1">' 
      + '<input class="picked-answer" type="checkbox" value="' + answerCounter + '"' 
      + 'name="correct_answers[]"></div>'
      + '<div class="col-xs-11">'
      + '<input class="form-control" type="text" name="answers[]">'
      + '</div></div>';
      $('.js-answers').append(htmlCode);
    } else {
      htmlCode = '<div class="row answer-row"><div class="col-xs-1">' 
      + '<input class="picked-answer" type="radio" value="' + answerCounter + '"' 
      + 'name="correct_answers[]"></div>'
      + '<div class="col-xs-11">'
      + '<input class="form-control" type="text" name="answers[]">'
      + '</div></div>';
      $('.js-answers').append(htmlCode);
    }
  });
});