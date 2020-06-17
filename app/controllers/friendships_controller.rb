class FriendshipsController < ApplicationController
  before_action :require_user

  def index
  end

  def show
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend"
      redirect_to friends_path
    else
      flash[:error] = "An error occured when adding friend"
      redirect_to users_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Friend was removed"
    redirect_to friends_path
  end

end
