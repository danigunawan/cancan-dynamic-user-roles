class UsersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.super_admin = false
    if @user.save
      redirect_to user_path(@user), notice: 'User was successfully added.' 
    else
      render action: 'new' 
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    new_params = user_params
    if new_params[:password].blank?
      new_params.delete(:password)
      new_params.delete(:password_confirmation)
    end

    if @user.update new_params
        redirect_to user_path(@user), notice: 'User was successfully added.' 
    else
      render action: 'edit' 
    end
  end


  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit!
    end
end
