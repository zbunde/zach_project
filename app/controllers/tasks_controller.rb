class TasksController < ApplicationController
  def new
    @task = Task.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    name = params[:task][:name]
    description = params[:task][:description]
    seller = current_user
    finish_by = params[:task][:finish_by]
    Task.create(:name => name, :description => description, :seller_id => seller, :listing_id => params[:listing_id], :finish_by => finish_by)
    redirect_to listing_path(params[:listing_id])
  end

  def show
    @task = Task.find(params[:id])
    @listing = Listing.find(params[:listing_id])
  end

  def edit
    @task = Task.find(params[:id])
    @listing = Listing.find(params[:listing_id])
  end

  def update
    @task = Task.find(params[:id])
    @listing = Listing.find(params[:listing_id])
    name = params[:task][:name]
    description = params[:task][:description]
    finish_by = params[:task][:finish_by]
    completed = params[:task][:completed]

    @task.update(:name => name, :description => description, :listing_id => params[:listing_id], :finish_by => finish_by, :completed => completed)
    if @task.save
      flash[:notice] = "Task Updated"
      redirect_to listing_path(params[:listing_id])
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id]).delete
    redirect_to listing_path(params[:listing_id])
  end
end