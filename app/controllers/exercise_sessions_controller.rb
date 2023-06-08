class ExerciseSessionsController < ApplicationController
  before_action :set_session, only: %i[show]

  def index
    @sessions = Session.all
    @sessions = Session.where("user_id = ?", current_user.id)
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user
    if params[:session][:sport_id].nil?
      @sport = Sport.create(name: params[:sport_input])
    else
      @sport = Sport.find(params[:session][:sport_id])
    end
    @session.sport = @sport
    @session.save
    redirect_to session_path(@session)
  end

  def show
    @blocks = @session.blocks
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:title, :date)
  end
end
