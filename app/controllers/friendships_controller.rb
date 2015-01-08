class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user.not_friends
    @friendship = @user.friends
  end

  def show
    @friendships = Friendship.find(params[:id])
  end

  def create
    friend = User.find(params[:friendship][:friend_id])
    current_user.friends << friend
    redirect_to root_path
  end

  def destroy
    @friendship = Friendship.find(params[:id]).destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end

end
