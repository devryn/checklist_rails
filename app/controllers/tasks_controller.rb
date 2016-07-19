class TasksController < ApplicationController
  def index
    render template: 'tasks/index.html.erb', locals: {
      tasks: Task.all
    }
  end

  def show
    render locals: {
      task: Task.find(params[:id])
    }
  end

  def new
    render locals: {
      task: Task.new,
    }
  end

  def create
    task = Task.new(task_params)
    list.name = params[:list][:name]
    task.position = params[:task][:position]
    task.body = params[:task][:body]
    task.completed = params[:task][:completed]
    if task.save
      redirect_to task_path(task)
    else
      render :new
    end
  end

  def edit
    render locals: {
      task: Task.find(params[:id])
    }
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      redirect_to task
    else
      render :edit
    end
  end

  def destroy
    if Task.exists?(params[:id])

      Task.destroy(params[:id])
      flash[:notice] = "Task destroyed."
      redirect_to "/tasks"
    else
      flash[:alert] = "Task was not deleted due to an error."
    end
  end

  private
  def task_params
    params.require(:task).permit(:completed, :body, :position)
  end
end
