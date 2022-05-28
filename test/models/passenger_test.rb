# frozen_string_literal: true

require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  test 'should not save passenger without name' do
    passenger = Passenger.new
    assert_not passenger.save, 'Saved the passenger without a name'
  end

  test 'should save passenger with name' do
    passenger = Passenger.new(name: 'Bruno Costanzo')
    assert passenger.save, 'Did not save the passenger with a name'
  end
end
