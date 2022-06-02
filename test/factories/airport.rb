# frozen_string_literal: true
require 'faker'

FactoryBot.define do
  factory :airport_with_code, class: Airport do
    code { Faker::Name.unique.initials(3) }
  end

  factory :airport, class: Airport do
  end

  factory :airport_one, class: Airport do
    code { 'AAA' }
  end

  factory :airport_two, class: Airport do
    code { 'BBB' }
  end

  factory :random_airport, class: Airport do
    city { Faker::Nation.unique.capital_city }
    code { "#{ city[0] }#{ city[1] }#{ city[2] }".upcase }
    name { "#{ city } Airport (#{ code })" }
  end

  factory :specific_airport_a, class: Airport do
    code { 'BUE' }
  end

  factory :specific_airport_b, class: Airport do
    code { 'MIA' }
  end
end
