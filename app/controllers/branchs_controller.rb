class BranchsController < ApplicationController
  def index
    @branch = Branch.all
    render 'branchs/new'
  end

  def show
    @branch = Branch.find(params[:id])
  end

  def new
    @branch = Branch.new
  end

  def edit
    @branch = Branch.find(params[:id])
  end

  def create
    @branch = Branch.new(params[:branch])

    if @branch.save
      redirect_to(@branch, :notice => 'Branch was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @branch = Branch.find(params[:id])

    if @branch.update_attributes(params[:branch])
      redirect_to(@branch, :notice => 'Branch was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy

    redirect_to(branch_index_url)
  end
end
