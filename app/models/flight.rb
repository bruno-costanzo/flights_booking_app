# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true
  validates :departure_date, presence: true
  validates :arrival_date, presence: true
  validate :different_airports

  def different_airports
    if departure_airport_id == arrival_airport_id
      errors.add(:arrival_airport_id, 'must be different from departure airport')
    end
  end

  def duration
    (arrival_date - departure_date).to_i
  end
end
