# frozen_string_literal: true

class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers, &:timestamps
  end
end
