class SchedulesController < ApplicationController
  def index
    @branch = Branch.find(params[:branch_id])
    redirect_to @branch
  end

  def create
    @branch = Branch.find(params[:branch_id])
    @schedule = @branch.schedules.create(schedule_params)
    redirect_to branch_path(@branch)
  end

  def edit
    @branch = Branch.find(params[:branch_id])
    @schedule = @branch.schedules.find(params[:id])
  end

  def destroy
    @branch = Branch.find(params[:branch_id])
    @schedule = @branch.schedules.find(params[:id])
    @schedule.destroy
    redirect_to branch_path(@branch), status: :see_other
  end

  private
    def schedule_params
      params.require(:schedule).permit(:day, :start, :end)
    end
end
