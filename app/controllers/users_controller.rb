class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in!
  before_action :require_at_least_manager!
  before_action :require_admin!, except: [:index, :show]

  def get_user
    @user = User.find(params[:id])
  end

  def index
    if Current.user.has_role? :admin
      @users = User.all
    else
      @users = User.with_role :client
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    role = params[:user][:role]
    if @user.save
      if role == "Administrador"
        @user.add_role :admin
      elsif role == "Personal"
        @user.add_role :manager      
      end
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    role = params[:user][:role]
    if @user.update(user_params)
      @user.remove_roles
      if role == "manager"
        @user.add_role :manager
      else
        @user.branch_id = nil
        if role == "admin"
          @user.add_role :admin
        else
          @user.add_role :client
        end
      end
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
      params.require(:user).permit(:email, :name, :password, :branch_id)
    end
    
end
