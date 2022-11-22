class SchedulesController < ApplicationController
  def create
    @branch = Branch.find(params[:branch_id])
    @schedule = @branch.schedules.create(schedule_params)
    redirect_to branch_path(@branch)
  end

  private
    def schedule_params
      params.require(:schedule).permit(:day, :start, :end)
    end
end
