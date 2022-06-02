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

Booking.destroy_all
Airport.destroy_all
Flight.destroy_all

60.times do
  airport = FactoryBot.build(:random_airport)
  airport.save if airport.valid?
end

Airport.all.each do |airport|
  50.times do
    flight = FactoryBot.build(:random_flight, departure_airport: airport, arrival_airport: Airport.where.not(id: airport.id).sample)
    flight.save if flight.valid?
  end
end

1000.times do
    passenger = FactoryBot.build(:passenger)
    passenger.save if passenger.valid?
  end

# Flight.all.each do |flight|
#   15.times do
#     booking = FactoryBot.build(:booking, flight: flight)
#     booking.save if booking.valid?
#   end
# end


# 10_000.times do
#   flight = FactoryBot.build(:random_flight)
#   flight.departure_airport = Airport.all.sample
#   flight.arrival_airport = Airport.where.not(id: flight.departure_airport.id).sample
#   flight.save
# end

# 1500.times do
#   passenger = FactoryBot.build(:passenger)
#   passenger.save if passenger.valid?
# end


