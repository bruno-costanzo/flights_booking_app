# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  validates :passenger_id, presence: true
  validates :flight_id, presence: true
end
