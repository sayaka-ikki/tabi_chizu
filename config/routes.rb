Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "homes#top"

  devise_scope :user do
    post "users_guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  get "search" => "searches#search"

  resources :users, only: [:index,:edit, :show, :create, :update]
  resources :favorite_posts, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :favorite_post_comments, only: [:create,:destroy]
  end
  resources :schedule_posts, only:[:new, :create, :index, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end

