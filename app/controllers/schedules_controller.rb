class SchedulesController < ApplicationController
  load_and_authorize_resource
  before_action :get_branch, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :get_schedule, only: [:edit, :update, :destroy]
  before_action :require_user_logged_in!
  before_action :require_admin!

  def get_branch
    @branch = Branch.find(params[:branch_id])
  end

  def get_schedule
    @schedule = Schedule.find(params[:id])
  end

  def index
    redirect_to @branch
  end

  def show
    redirect_to @branch
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = @branch.schedules.create(schedule_params)
    if @schedule.save
      redirect_to @branch
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to @branch
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    redirect_to @branch, status: :see_other
  end

  private
    def schedule_params
      params.require(:schedule).permit(:day, :start, :end)
    end
end
