class Trainee::TraineeAnswerSheetsController < ApplicationController
  before_action :authenticate_loggedin_user
  before_action :authenticate_trainee_user

  def index
    @answer_sheets = current_user.trainee_answer_sheets.page(params[:page]).per(Settings.trainee_answer_sheet.paging.per)
  end
end
