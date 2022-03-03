Rails.application.routes.draw do
  root to: "homes#top"
  namespace :admin do
    resources :admin_sessions, only: [:new, :create, :destroy]
  end

  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
