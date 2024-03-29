# frozen_string_literal: true

class AddPropertyRefToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :property, null: false, foreign_key: true
  end
end
