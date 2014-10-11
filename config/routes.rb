Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'home#index'

  get 'about' => "home#about"

  resources :lists

  resources :lists do
    # resources :tasks, only: [:create, :edit, :update], controller: 'lists/tasks'
    resources :tasks, controller: 'lists/tasks'
  end

end
