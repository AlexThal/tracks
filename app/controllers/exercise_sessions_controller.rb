class ExerciseSessionsController < ApplicationController
  before_action :set_session, only: %i[show create destroy]

  def index
    @sessions = Session.all
    @sessions = Session.where("user_id = ?", current_user.id)
  end

  def show
    @blocks = @session.blocks
    @block = Block.new
    @set = ExerciseSet.new
  end

  def create
  end

  def destroy
    @session.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end
end
