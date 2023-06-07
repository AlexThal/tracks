class ExerciseSessionsController < ApplicationController
  before_action :set_session, only: %i[show]

  def index
    @sessions = Session.where("user = ?", current_user)
    raise
  end

  def show
  end

  private

  def set_session
    @session = Session.find(params[:session_id])
  end
end
