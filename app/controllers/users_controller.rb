class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :get_user, only: [:show, :edit, :update, :destroy]

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
    if role == "admin"
      @user.add_role :admin
    elsif role == "manager"
      @user.add_role :manager      
    end
    if @user.save      
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    role = params[:user][:role]
    branch_id = params[:user][:branch_id]
    if (role == "manager") && (branch_id == "")
      redirect_to edit_user_path, alert: "Debe seleccionar una sucursal si el usuario tiene el rol Personal."
    elsif @user.update(user_params)
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
