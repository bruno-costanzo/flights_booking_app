# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    flight_id { Flight.all.sample.id }
    passenger_id { Passenger.all.sample.id }
  end
end
