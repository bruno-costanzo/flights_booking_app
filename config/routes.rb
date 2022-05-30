# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'bookings/new'
  post 'bookings/create'
  get 'flights/index'
  post 'passengers/create'
  # Defines the root path route ("/")
  root 'flights#index'
end
