class FriendshipsController < ApplicationController

  def index
    @users = current_user.not_friends
    @friendship = Friendship.new
  end

  def show
    @friendships = current_user.friends
  end

  def create
    friend = User.find(params[:friendship][:friend_id])
    current_user.friends << friend
    redirect_to root_url
  end

  def destroy
    @friendship = current_user.friendships.find(params[:friend_id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end


end
