class PagesController < ApplicationController
  # before_action :set_item, only: %i[show edit destroy update]
  # skip_before_action :authenticate_user!, only: %i[index show]

  def home
    @sessions = Session.where("user_id = ?", current_user.id).first(3)
  end

  # def dashboard
  #   @session = Session.find(params[:session_id])
  # end
end
