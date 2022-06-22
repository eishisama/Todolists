class TodayTasksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @today_task = TodayTask.new
    @today_tasks = current_user.today_tasks
  end
  
  def create
    @today_task = TodayTask.new(today_task_params)
    @today_tasks = current_user.today_tasks
    @today_task.user_id = current_user.id
    if @today_task.save
      redirect_to today_tasks_path, notice: 'You have created today task successfully!'
    else
      render :index
    end
  end
  
  def edit
    @today_task = TodayTask.find(params[:id])
    if @today_task.user.id == current_user.id
      render "edit"
    else
      redirect_to root_path
    end
  end
  
  def update
    @today_task = TodayTask.find(params[:id])
    if @today_task.update(today_task_params)
      redirect_to today_tasks_path, notice: 'You have updated today task successfully!'
    else
      render :edit
    end
  end
  
  def destroy
    today_task = TodayTask.find(params[:id])
    today_task.destroy
    redirect_to today_tasks_path
  end
  
  private
  
  def today_task_params
    params.require(:today_task).permit(:name, :content)
  end
end
