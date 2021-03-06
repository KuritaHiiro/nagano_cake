Rails.application.routes.draw do
  root to: "public/homes#top"
  get "/about" => "public/homes#about"

  #管理者用
  #URL/admin/sign_in
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    get "/" => "homes#top"
    patch "/admin/order_details/:id" => "order_details#update", as: "order_details"
  end

  #顧客用
  #URL/customers/sign_in
  scope module: :public do
    resource :customers, only: [:show, :edit, :update]
    delete "/cart_items/empty" => "cart_items#empty", as: "empty"
    post "orders/confirm" => "orders#confirm", as: "confirm"
    get "orders/complete" => "orders#complete",as: "complete"
    get "/customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
    patch "/customers/withdrawal" => "customers#withdrawal", as: "withdrawal"
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show]
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
