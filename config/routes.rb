# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :providers, :defaults => { format:  :json }
  resources :flights, :defaults => { format:  :json }
  root 'flights#index', :defaults => { format:  :json }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
