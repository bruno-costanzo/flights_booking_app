# frozen_string_literal: true

FactoryBot.define do
  factory :flight, class: Flight do
    departure_date { Date.today }
    arrival_date { Date.tomorrow }
    departure_airport { create(:airport_one) }
    arrival_airport { create(:airport_two) }
  end

  factory :random_flight, class: Flight do
    departure_date { Faker::Time.forward(365) }
    arrival_date { departure_date + rand(1..1440).minutes }
  end
end
