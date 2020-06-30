$(document).on('turbolinks:load', function(){
  $('.js-finish-btn').click(function(){
    var answersheetArr = [];
    questionIds = $('.question-id');
    for (index = 0; index < questionIds.length; index++){
      questionClassname = '.question-' + questionIds[index].value + ' > div > label > input:checked';
      traineeAnswers = $(questionClassname);
      traineeAnswersArr = [];
      for (i = 0; i < traineeAnswers.length; i++){
        traineeAnswersArr.push(traineeAnswers[i].value);
      }
      var traineeAnswer = {question_id: questionIds[index].value, trainee_answers: traineeAnswersArr};
      answersheetArr.push(traineeAnswer);
    }
    $('#trainee_answer_sheet_answer_sheet').val(JSON.stringify(answersheetArr));
  });

  function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.text(minutes + ":" + seconds);

        if (--timer < 0) {
            timer = duration;
        }

        if (timer == 0 ){
          $('.js-finish-btn').click();
        }
    }, 1000);
  };

  jQuery(function ($) {
    var minutes = $('.js-countdown-timer').attr("value") * 60 - 1,
        display = $('.js-countdown-timer');
    startTimer(minutes, display);
  });
});
