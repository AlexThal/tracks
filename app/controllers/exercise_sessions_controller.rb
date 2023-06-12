class ExerciseSessionsController < ApplicationController
  before_action :set_session, only: %i[show destroy copy_session]

  def index
    @sessions = current_user.sessions
    # @suggested_friends = User.where.not(id: current_user.id)
    @friends_sessions = Session.where(user: current_user.friends)
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user

    if params[:session][:sport_id].nil? || params[:session][:sport_id].empty?
      @sport = Sport.create(name: params[:sport_input])
    else
      @sport = Sport.find(params[:session][:sport_id])
    end
    @session.sport = @sport

    if @session.save
      redirect_to exercise_session_path(@session)
    else
      render "exercise_sessions/show", status: :unprocessable_entity
    end
  end

  def show
    @blocks = @session.blocks
    @block = Block.new
    @set = ExerciseSet.new
  end

  def destroy
    @session.destroy
    redirect_to root_path, status: :see_other
  end

  def copy_session
    @copy_session = @session.dup
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:title, :date, :sport)
  end
end
