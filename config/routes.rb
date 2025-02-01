Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :dashboards, only: [:index, :show]
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:show, :destroy]
  end

  scope module: :public do
    devise_for :users
    root to: "homes#top"
    get 'homes/about' => 'homes#about', as: 'about'
    get "search" => "searches#search"

    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
