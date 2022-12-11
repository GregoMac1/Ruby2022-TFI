class TurnsController < ApplicationController
  before_action :get_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :get_turn, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in!

  def get_user
    @user = Current.user
  end

  def get_turn
    @turn = Turn.find(params[:id])
  end

  def index
    puts Turn.first.inspect
    @pending_turns = Turn.where(client_id: @user.id, status: "pending")
    @past_turns = Turn.where(client_id: @user.id) - @pending_turns
  end

  def new
    @turn = Turn.new
  end

  def create
    params[:turn][:client_id] = @user.id
    @turn = Turn.new(turn_params)
    if @turn.save
      redirect_to turns_path, notice: "Se ha creado el turno."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @turn.update(turn_params)
      redirect_to turns_path, notice: "Se ha modificado el turno."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @turn.destroy
    redirect_to turns_path, notice: "Se ha cancelado el turno."
  end

  private
    def turn_params
      params.require(:turn).permit(:client_id, :branch_id, :date, :time, :reason)
    end
end
