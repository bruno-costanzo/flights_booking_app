# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'factory_bot_rails'
require 'faker'

Airport.destroy_all
Flight.destroy_all

200.times do
  airport = FactoryBot.build(:random_airport)
  airport.save if airport.valid?
end

2500.times do
  flight = FactoryBot.build(:random_flight)
  flight.departure_airport = Airport.all.sample
  flight.arrival_airport = Airport.where.not(id: flight.departure_airport.id).sample
  flight.save
end
