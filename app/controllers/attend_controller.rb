class AttendController < ApplicationController
  before_action :get_user
  before_action :require_user_logged_in!
  before_action :require_manager!

  def get_user
    @user = Current.user
  end

  def index
    @turns = Turn.where(branch_id: @user.branch_id, status: "pending")
  end

  def attend
    @turn = Turn.find(params[:id])
    if params[:result].blank?
      redirect_to "/attend", alert: "Debe ingresar un resultado."
      return
    end
    if @turn.update(status: "attended", manager_id: @user.id, result: params[:result])
      redirect_to "/attend", notice: "Se ha atendido el turno."
    else
      redirect_to "/attend", alert: "No se ha podido atender el turno."
    end
  end
end
