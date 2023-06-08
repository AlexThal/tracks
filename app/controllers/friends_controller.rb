class FriendsController < ApplicationController
  def new
      @friends = Friends.new
  end


end
