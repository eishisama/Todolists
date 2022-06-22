class MonthTasksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @month_task = MonthTask.new
    @month_tasks = current_user.month_tasks
  end
  
  def create
    @month_task = MonthTask.new(month_task_params)
    @month_tasks = current_user.month_tasks
    @month_task.user_id = current_user.id
    if @month_task.save
      redirect_to month_tasks_path, notice: 'You have created month task successfully!'
    else
      render :index
    end
  end
  
  def edit
    @month_task = MonthTask.find(params[:id])
    if @month_task.user.id == current_user.id
      render "edit"
    else
      redirect_to root_path
    end
  end
  
  def update
    @month_task = MonthTask.find(params[:id])
    if @month_task.update(month_task_params)
      redirect_to month_tasks_path, notice: 'You have updated month task successfully!'
    else
      render :edit
    end
  end
  
  def destroy
    month_task = MonthTask.find(params[:id])
    month_task.destroy
    redirect_to month_tasks_path
  end
  
  private
  
  def month_task_params
    params.require(:month_task).permit(:name, :content)
  end
end
