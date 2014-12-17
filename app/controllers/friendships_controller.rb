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
    # @friendship = current_user.friendships.build(friend_id: params[:friend_id], user_id: current_user.id)
    # if @friendship.save
    #   flash[:notice] = "Added friend."
    #   redirect_to root_url
    # else
    #   flash[:error] = "Unable to add friend."
    #   puts @friendship.errors.full_messages
    #   redirect_to root_url
    # end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:friend_id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end


end
