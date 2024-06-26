Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"

  devise_scope :user do
    post "users_guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :users, only: [:index,:edit, :show, :create, :update]




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
