class ExerciseSessionsController < ApplicationController
  before_action :set_session, only: %i[show]

  def index
    @sessions = Session.all
    @sessions = Session.where("user_id = ?", current_user.id)
  end

  def show
    @blocks = @session.blocks
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end
end
