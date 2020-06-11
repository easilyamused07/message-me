class Friendships2Controller < ApplicationController

  def create
    if params.include?(:friend_id)
      @new_friendships = Friendship.create_reciprocal_for_ids(current_user_id, params[:friend_id])
    else
      params[:user][:friend_ids].each do |f_id|
      @new_friendships = Friendship.create_reciprocal_for_ids(current_user_id, f_id)
      end
    end
    redirect_to users_path
  end
  
  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
    redirect_to friends_path
  end

end
