class PagesController < ApplicationController
  # before_action :set_item, only: %i[show edit destroy update]
  # skip_before_action :authenticate_user!, only: %i[index show]

  def home
    @session = Session.all
    
  end

  # def dashboard
  #   @session = Session.find(params[:session_id])
  # end
end
