class PagesController < ApplicationController
  # before_action :set_item, only: %i[show edit destroy update]
  # skip_before_action :authenticate_user!, only: %i[index show]

  def home
  end

  # def dashboard
  #   @sessions = current_user.sessions
  #   @sessions = followed_user.sessions
  # end
end
