class ExerciseSessionsController < ApplicationController
  before_action :set_session, only: %i[show]

  def index
    @sessions = current_user.sessions
    # @suggested_friends = User.where.not(id: current_user.id)
    @friends_sessions = Session.where(user: current_user.friends)
  end

  def show
    @blocks = @session.blocks
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end
end
