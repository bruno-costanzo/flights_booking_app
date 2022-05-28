# frozen_string_literal: true

require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  test 'should not save airport without code' do
    airport = FactoryBot.build(:airport)
    assert_not airport.save, 'Saved the airport without a code'
  end

  test 'should save airport with code' do
    airport_with_code = FactoryBot.build(:airport_with_code)
    assert airport_with_code.save, 'Did not save the airport with a code'
  end

  test 'should have many departure_flights' do
    airport = FactoryBot.build(:airport)
    assert_respond_to airport, :departing_flights, 'Airport does not have many flights'
  end

  test 'should have many arrival_flights' do
    airport = FactoryBot.build(:airport)
    assert_respond_to airport, :arriving_flights, 'Airport does not have many flights'
  end
end
