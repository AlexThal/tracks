class PagesController < ApplicationController
  # before_action :set_item, only: %i[show edit destroy update]
  # skip_before_action :authenticate_user!, only: %i[index show]

  def home
    # @sessions = Session.all
    @sessions = current_user.sessions.first(3)
    @following_sessions = Session.where(user: current_user.friends)
  end
end
