# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight
  accepts_nested_attributes_for :passenger

  validates :passenger_id, presence: true
  validates :flight_id, presence: true
  validate :one_per_flight_and_passenger

  def one_per_flight_and_passenger
    if Booking.where(passenger_id: passenger_id, flight_id: flight_id).exists?
      errors.add(:passenger_id, "with email #{ Passenger.find(passenger_id).email } already booked on this flight")
    end
  end
end
