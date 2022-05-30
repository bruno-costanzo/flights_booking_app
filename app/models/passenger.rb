# frozen_string_literal: true

class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
