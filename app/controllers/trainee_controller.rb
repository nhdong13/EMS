class TraineeController < ApplicationController
  def index; end

  def active_subjects
    @subject = current_user.active_subjects
  end
end
