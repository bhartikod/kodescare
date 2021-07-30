# frozen_string_literal: false

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'dashboard#home'
  get 'general_informations', to: 'general_information#new'
  post 'general_informations', to: 'general_information#create'

  resources :tests, only: %i[new create show]
  resources :user_answers, only: %i[index new create] do
    collection do
      get :back
    end
  end
  post 'subscribers/create'
  get 'set_timer', to: 'user_answers#set_timer', as: :set_timer
  get 'privacy_policy', to: 'dashboard#privacy_policy'
  get 'about_us', to: 'dashboard#about_us'
  get 'contact_us', to: 'dashboard#contact_us'
  get 'courses', to: 'dashboard#courses'
  get 'courses_detail', to: 'dashboard#courses_detail'
  get 'designing_detail', to: 'dashboard#designing_detail'
  get 'stacks', to: 'dashboard#stacks'
  get 'developers', to: 'dashboard#developers'
  match 'users/otp' => 'dashboard#otp', as: :user_otp, via: %i[get post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
