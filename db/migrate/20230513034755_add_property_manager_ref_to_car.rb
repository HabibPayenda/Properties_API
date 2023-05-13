# frozen_string_literal: true

class AddPropertyManagerRefToCar < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :property_manager, null: false, foreign_key: true
  end
end
