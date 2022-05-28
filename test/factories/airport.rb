# frozen_string_literal: true

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
    code { Faker::Name.initials(3) }
  end
end
