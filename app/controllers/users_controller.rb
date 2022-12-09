class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def get_user
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, status: :see_other
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password)
    end
    
end
