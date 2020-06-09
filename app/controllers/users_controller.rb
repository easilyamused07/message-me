class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:sucess] = "Weclome to Message-Me #{@user.username}!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
