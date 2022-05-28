# frozen_string_literal: true

class Passenger < ApplicationRecord
  validates :name, presence: true
end
