class TurnsController < ApplicationController
  before_action :get_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :get_turn, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in!

  def get_user
    @user = User.find(params[:user_id])
  end

  def get_turn
    @turn = Turn.find(params[:id])
  end

  def index
    @pending_turns = Turn.where(client_id: @user.id, status: "pending")
    @past_turns = Turn.all - @pending_turns
  end

  def show
  end

  def new
    @turn = Turn.new
  end

  def create
    @turn = Turn.new(turn_params)
    if @turn.save
      redirect_to @turn
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @turn.update(turn_params)
      redirect_to @turn
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @turn.destroy
    redirect_to turns_url, status: :see_other
  end

  private
    def turn_params
      params.require(:turn).permit(:name, :address, :phone)
    end
end
