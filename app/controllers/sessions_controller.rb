class SessionsController < ApplicationController
  before_action :set_session, only: %i[show]

  def index
    @sessions = Session.all
  end

  def show
  end

  private

  def set_session
    @session = Session.find(params[:session_id])
  end
end
