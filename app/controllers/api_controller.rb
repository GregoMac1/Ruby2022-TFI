class ApiController < ApplicationController
  def branch_schedules
    @schedules = Schedule.where(branch_id: params[:branch_id])
    render json: @schedules
  end
end
