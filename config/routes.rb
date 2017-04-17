Rails.application.routes.draw do
  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resource :admin, only: [:show, :edit, :update]
  resources :dishes
  resource :order, only: :show
  resources :order_dishes, only: [:create, :update, :destroy]
  resources :order_combos, only: [:create, :update, :destroy]
  resources :combos

  namespace :admin do
    resources :categories do
      resources :dishes
    end
    resources :dishes
    resources :combos do
      resources :dishes
    end
    resources :orders do
      resources :order_dishes
      resources :order_combos
    end
  end
end
