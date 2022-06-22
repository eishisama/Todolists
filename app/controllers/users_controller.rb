class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render "edit"
    else
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to today_tasks_path, notice: 'You have updated user successfully!'
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :profession)
  end
end