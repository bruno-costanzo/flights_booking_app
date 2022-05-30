# frozen_string_literal: true

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  test 'should not save booking without a flight' do
    booking = Booking.new
    booking.save
    assert_not_empty booking.errors[:flight_id]
  end

  test 'should not save booking without a passenger' do
    booking = Booking.new
    booking.save
    assert_not_empty booking.errors[:passenger_id]
  end

  test 'should save booking with a flight and a passenger' do
    booking = FactoryBot.build(:booking)
    assert booking.save, 'Did not save the booking with a flight and a passenger'
  end
end
