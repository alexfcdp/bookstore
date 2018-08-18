# frozen_string_literal: true

Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'
end
