Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about"=>"homes#about"

  resources :today_tasks, only: [:index, :create, :edit, :update, :destroy]
  resources :month_tasks, only: [:index, :create, :edit, :update, :destroy]
  resources :users, only: [:edit, :update]
end
