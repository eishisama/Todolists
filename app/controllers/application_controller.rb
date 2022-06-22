class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!,except: [:top, :new, :create, :about]
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    today_tasks_path
  end
  
  def after_sign_up_path_for(resource)
    month_tasks_path
  end
  
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
