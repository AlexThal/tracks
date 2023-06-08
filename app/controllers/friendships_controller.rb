class FriendshipsController < ApplicationController
  def create
    @friend = User.find(params[:friend_id])
    @friendship = Friendship.create({ user: current_user, friend: @friend })
    flash[:notice] = "Followed friend"
  end
end
