class BranchesController < ApplicationController
  before_action :get_branch, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in!

  def get_branch
    @branch = Branch.find(params[:id])
  end

  def index
    @branches = Branch.all
  end

  def show
  end

  def new
    @branch = Branch.new
  end

  def create
    @branch = Branch.new(branch_params)
    if @branch.save
      redirect_to @branch
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @branch.update(branch_params)
      redirect_to @branch
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @branch.destroy
    redirect_to branches_url, status: :see_other
  end

  private
    def branch_params
      params.require(:branch).permit(:name, :address, :phone)
    end
end
