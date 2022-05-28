# frozen_string_literal: true

require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  test 'should not save flight without a departure_date' do
    flight = Flight.new(departure_date: nil)
    flight.save
    assert_not_empty flight.errors[:departure_date]
  end

  test 'should not save flight without a arrival_date' do
    flight = Flight.new(arrival_date: nil)
    flight.save
    assert_not_empty flight.errors[:arrival_date]
  end

  test 'should not save flight without a arrival_airport_id' do
    flight = Flight.new(arrival_airport_id: nil)
    flight.save
    assert_not_empty flight.errors[:arrival_airport_id]
  end

  test 'should not save flight without a departure_airport_id' do
    flight = Flight.new(departure_airport_id: nil)
    flight.save
    assert_not_empty flight.errors[:departure_airport_id]
  end

  test 'should responde to duration' do
    flight = Flight.new(departure_date: Date.today, arrival_date: Date.tomorrow, departure_airport_id: 1,
                        arrival_airport_id: 1)
    assert_respond_to flight, :duration, 'Flight does not respond to duration'
  end

  test 'should belongs to departure_airport' do
    flight = Flight.reflect_on_association(:departure_airport)
    assert_equal :belongs_to, flight.macro
  end

  test 'should belongs to arrival_airport' do
    flight = Flight.reflect_on_association(:arrival_airport)
    assert_equal :belongs_to, flight.macro
  end

  test 'departure_airport should be a class of Airport' do
    flight = FactoryBot.build(:flight)
    assert_instance_of Airport, flight.departure_airport, 'Departure airport is not an instance of Airport'
  end

  test 'arrival_airport should be a class of Airport' do
    flight = FactoryBot.build(:flight)
    assert_instance_of Airport, flight.arrival_airport, 'Arrival airport is not an instance of Airport'
  end

  test 'should not save flight if departure_airport is equal to arrival_airport' do
    flight = FactoryBot.build(:flight)
    flight.departure_airport_id = flight.arrival_airport_id
    flight.valid?
    assert_not_empty flight.errors[:arrival_airport_id], 'Flight saved with same departure and arrival airport'
  end
end
