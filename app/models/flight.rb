# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true
  validates :departure_date, presence: true
  validates :arrival_date, presence: true
  validate :different_airports

  def self.search(params)
    return [] if params.empty?

    flights = Flight.all
    flights = flights.where(departure_airport_id: params[:from].to_i) if params[:from].present?
    flights = flights.where(arrival_airport_id: params[:to].to_i) if params[:to].present?
    flights = flights.where(departure_date: params[:date]) if params[:date].present?
    flights
  end

  def duration
    (arrival_date - departure_date).to_i
  end

  private

  def different_airports
    if departure_airport_id == arrival_airport_id
      errors.add(:arrival_airport_id, 'must be different from departure airport')
    end
  end
end
