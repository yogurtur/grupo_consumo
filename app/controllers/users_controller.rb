class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :not_need_authenticate, only: [:new]

  def show
    @user = User.find(params[:id])
  end
  
  def new
     @user = User.new
  end
  
  def create
     @user = User.new(user_params)
     if @user.save
        sign_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to root_url
     else
        render 'new'
     end
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end



end
