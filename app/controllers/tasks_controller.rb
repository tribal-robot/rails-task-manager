class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to show_path(@task)
    else
      @error = 'Error: Task save failed'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    raise
    # @task = Task.find(params[:id])
    # @task.update(task_params)
    # redirect_to show_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
