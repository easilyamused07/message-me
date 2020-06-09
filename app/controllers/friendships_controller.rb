class FriendshipsController < ApplicationController
  before_action :require_user

  def index
    @friendships = Friendship.all
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend"
      redirect_to friends_path
    else
      flash[:error] = "Error occured when adding friend. Try again."
      redirect_to friends_path
    end
  end

  def destory
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Friend was removed"
    redirect_to friends_path
  end

end
