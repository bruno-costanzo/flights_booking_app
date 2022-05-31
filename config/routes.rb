# frozen_string_literal: true

Rails.application.routes.draw do
  # Bookings routes
  get 'bookings/new'
  get 'bookings/checkout'
  post 'bookings/create'

  # Flights routes
  get 'flights/index'

  # Passengers routes
  post 'passengers/create'

  # Root route
  root 'flights#index'
end
