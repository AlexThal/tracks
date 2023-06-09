class FriendshipsController < ApplicationController
  def create
    @friend = User.find(params[:friend_id])
    @friendship = Friendship.create({ user: current_user, friend: @friend })
    redirect_to root_path
    flash[:notice] = "You are now following #{@friend.username}"
  end
end
